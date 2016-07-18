# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

require Rails.root.join('db', 'seeds', 'support', 'group_seeder')

seeder = GroupSeeder.new

ch = Group.roots.first
srand(42)

unless ch.address.present?
  ch.update_attributes(seeder.group_attributes)
  ch.default_children.each do |child_class|
    child_class.first.update_attributes(seeder.group_attributes)
  end
end

states = Group::Region.seed(:name, :parent_id,
  {name: 'Region Bern',
   address: "Klostergasse 3",
   zip_code: "3333",
   town: "Bern",
   country: "Svizzera",
   email: "bern@be.ch",
   parent_id: ch.id},

  {name: 'Region Zürich',
   address: "Tellgasse 3",
   zip_code: "8888",
   town: "Zürich",
   country: "Svizzera",
   email: "zuerich@zh.ch",
   parent_id: ch.id },

  {name: 'Region Nordost',
   address: "Nordostgasse 3",
   zip_code: "9000",
   town: "Nordosthausen",
   country: "Svizzera",
   email: "nordost@nordost.ch",
   parent_id: ch.id }
)

states.each do |s|
  seeder.seed_social_accounts(s)
  board = s.children.where(type: 'Group::RegionBoard').first
  board.update_attributes(seeder.group_attributes)
end



clubs = Group::Local.seed(:name, :parent_id,
seeder.group_attributes.merge(
  {name: 'Verein Bern Stadt',
   short_name: 'Bern Stadt',
   parent_id: states[0].id }),

seeder.group_attributes.merge(
  {name: 'Verein Konolfingen',
   short_name: 'Konolfingen',
   parent_id: states[0].id }),

seeder.group_attributes.merge(
  {name: 'Verein Biel',
   short_name: 'Biel',
   parent_id: states[0].id }),

seeder.group_attributes.merge(
  {name: 'Verein Düdingen',
   short_name: 'Düdingen',
   parent_id: states[0].id }),

seeder.group_attributes.merge(
  {name: 'Verein Kerzers',
   short_name: 'Kerzers',
   parent_id: states[0].id }),

seeder.group_attributes.merge(
  {name: 'Verein Züri Stadt',
   short_name: 'Züri',
   parent_id: states[1].id }),

seeder.group_attributes.merge(
  {name: 'Verein Seebach',
   short_name: 'Seebach',
   parent_id: states[1].id }),

seeder.group_attributes.merge(
  {name: 'Verein ZH Oberland',
   short_name: 'Oberland',
   parent_id: states[1].id }),

seeder.group_attributes.merge(
  {name: 'Verein Solothurn',
   short_name: 'Solothurn',
   parent_id: states[2].id })
)

clubs.each do |s|
  seeder.seed_social_accounts(s)
end

Group.rebuild!
