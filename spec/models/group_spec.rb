require 'spec_helper'

describe Group do

  describe 'fixtures' do
    it "is a valid nested set" do
      begin
        Group.should be_left_and_rights_valid
        Group.should be_no_duplicates_for_columns
        Group.should be_all_roots_valid
        Group.should be_valid
      rescue => e
        puts e
        Group.rebuild!
        puts "valid are:"
        Group.order(:lft).each do |g|
          puts "  " * g.level + "#{g.name} lft: #{g.lft}, rgt: #{g.rgt}"
        end
      end
    end

    it "has all layer_group_ids set correctly" do
      Group.all.each do |group|
        msg = "#{group.to_s}: expected <#{group.layer_group.id}> (#{group.layer_group.to_s}), "
        msg << "got <#{group.layer_group_id}> (#{Group.find(group.layer_group_id).to_s})"
        group.layer_group_id.should(eq(group.layer_group.id), msg)
      end
    end
  end

  describe "#all_types" do
    subject { Group.all_types}

    it "must have root as the first item" do
      subject.first.should == Group::TopLayer
    end

    it "must have simple group as last item" do
      subject.last.should == Group::Basic
    end
  end

  describe ".course_offerers" do
    subject { Group.course_offerers }

    it "includes top layer" do
      should include groups(:ch)
    end

    it "includes layers" do
      should include groups(:be)
      should include groups(:no)
      should include groups(:bern)
      should include groups(:thun)
    end

    it "does not include basic groups" do
      should_not include groups(:asterix)
      should_not include groups(:obelix)
      should_not include groups(:mickey)
    end

    it "orders by parent and name" do
      expected = ["Verband", "Nordostschweiz", "Region Bern", "Ausserroden", "Innerroden", "Stadt Bern", "Thun"]
      subject.map(&:name).should eq expected
    end
  end


  def self.each_child(group)
    @processed ||= []
    @processed << group
    group.possible_children.each do |child|
      yield child unless @processed.include?(child)
    end
  end

  each_child(Group::TopLayer) do |group|
    context group do

      it "default_children must be part of possible_children" do
        group.possible_children.should include(*group.default_children)
      end

      unless group.layer?
        it "only layer groups may contain layer children" do
          group.possible_children.select(&:layer).should be_empty
        end
      end

      group.role_types.each do |role|
        context role do
          it "must have valid permissions" do
            # although it looks like, this example is about role.permissions and not about Role::Permissions
            Role::Permissions.should include(*role.permissions)
          end
        end
      end
    end
  end
end
