# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

require Rails.root.join('db', 'seeds', 'support', 'person_seeder')

class GenericPersonSeeder < PersonSeeder

  def amount(role_type)
    case role_type.name.demodulize
    when 'Member', 'Participant', 'ActiveMember', 'PassiveMember' then 5
    when 'Contact' then 10
    else 1
    end
  end

  def seed_demo_person(email, group, role_type)
    attrs = person_attributes(role_type).merge(email: email)
    p = Person.seed(:email, attrs).first
    seed_accounts(p, false)
    seed_role(p, group, role_type)

    p
  end
end


puzzlers = [
  'Andreas Maierhofer',
  'Carlo Beltrame',
  'Matthias Viehweger',
  'Nils Rauch',
  'Olivier Brian',
  'Pascal Simon',
  'Pascal Zumkehr',
]
devs = {'Somebody' => 'some@email.example.com'}

puzzlers.each do |puz|
  devs[puz] = "#{puz.split.last.downcase}@puzzle.ch"
end


seeder = GenericPersonSeeder.new

seeder.seed_all_roles

root = Group.root
devs.each do |name, email|
  seeder.seed_developer(name, email, root, Group::TopLayer::Administrator)
end

seeder.assign_role_to_root(Group.root, Group::TopLayer::Administrator)

gs = Group.find_by_name('Region Bern').children.where(type: Group::RegionBoard.sti_name).first
seeder.encrypted_password = BCrypt::Password.create("demo", cost: 1)

admin = seeder.seed_demo_person('admin@hitobito.ch', root, Group::TopLayer::Administrator)
seeder.seed_role(admin, gs, Group::TopLayerOffice::Treasurer)

seeder.seed_demo_person('leitung@hitobito.ch', gs, Group::RegionBoard::President)
seeder.seed_demo_person('mitglied@hitobito.ch', Group.find_by_name('Verein Bern Stadt'), Group::Local::ActiveMember)
