# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

require 'spec_helper'

describe Group do

  include_examples 'group types'

  describe "#all_types" do
    subject { Group.all_types}

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


end
