# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

ch = Group.roots.first
srand(42)

def contacts
  { short_name: ('A'..'Z').to_a.sample(2).join,
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip,
    town: Faker::Address.city,
    email: Faker::Internet.safe_email
  }
end

unless ch.address.present?
  ch.update_attributes(contacts)
  ch.default_children.each do |child_class|
    child_class.first.update_attributes(contacts)
  end
end

Group::Board.seed(:name, :parent_id,
  {name: 'Verbandsleitung',
   parent_id: ch.id },
)

states = Group::Layer.seed(:name, :parent_id,
  {name: 'Region Bern',
   short_name: 'BE',
   address: "Klostergasse 3",
   zip_code: "3333",
   town: "Bern",
   country: "Svizzera",
   email: "bern@be.ch",
   parent_id: ch.id},

  {name: 'Region Zürich',
   short_name: 'ZH',
   address: "Tellgasse 3",
   zip_code: "8888",
   town: "Zürich",
   country: "Svizzera",
   email: "zuerich@zh.ch",
   parent_id: ch.id },

  {name: 'Region Nordost',
   short_name: 'NO',
   address: "Nordostgasse 3",
   zip_code: "9000",
   town: "Nordosthausen",
   country: "Svizzera",
   email: "nordost@nordost.ch",
   parent_id: ch.id }
)

states.each do |s|
  SocialAccount.seed(:contactable_id, :contactable_type, :name,
    { contactable_id:   s.id,
      contactable_type: 'Group',
      name:             "#{s.name.downcase.split(' ').last}@hitobito.example.com",
      label:            'E-Mail',
      public:           true }
  )

  PhoneNumber.seed(:contactable_id, :contactable_type, :number,
    { contactable_id:   s.id,
      contactable_type: 'Group',
      number:           Faker::PhoneNumber.phone_number,
      label:            Settings.phone_number.predefined_labels.first,
      public:           true }
  )
  ast = s.children.where(type: 'Group::Board').first
  ast.update_attributes(contacts)
end

Group::Basic.seed(:name, :parent_id,
  {name: 'FG Sicherheit',
   parent_id: states[0].id },

  {name: 'FG Security',
   parent_id: states[2].id },
)

clubs = Group::Layer.seed(:name, :parent_id,
  {name: 'Verein Stadt',
   parent_id: states[0].id }.merge(contacts),

  {name: 'Verein Oberland',
   parent_id: states[0].id }.merge(contacts),

  {name: 'Verein Jura',
   parent_id: states[0].id }.merge(contacts),

  {name: 'Verein Stadt',
   parent_id: states[1].id }.merge(contacts),

  {name: 'Verein Oberland',
   parent_id: states[1].id }.merge(contacts),
)

clubs.each do |s|
  SocialAccount.seed(:contactable_id, :contactable_type, :label,
    { contactable_id:   s.id,
      contactable_type: 'Group',
      name:             "#{s.name.downcase.split(' ').last}@hitobito.example.com",
      label:            'E-Mail',
      public:           true }
  )

  PhoneNumber.seed(:contactable_id, :contactable_type, :label,
    { contactable_id:   s.id,
      contactable_type: 'Group',
      number:           Faker::PhoneNumber.phone_number,
      label:            Settings.phone_number.predefined_labels.first,
      public:           true },
  )
end

basics = Group::Basic.seed(:name, :parent_id,
  {name: 'Asterix',
   parent_id: clubs[0].id },

  {name: 'Obelix',
   parent_id: clubs[0].id },

  {name: 'Idefix',
   parent_id: clubs[0].id },

  {name: 'Mickey',
   parent_id: clubs[1].id },

  {name: 'Minnie',
   parent_id: clubs[2].id },

  {name: 'Goofy',
   parent_id: clubs[3].id },

  {name: 'Donald',
   parent_id: clubs[4].id },

  {name: 'Gustav',
   parent_id: clubs[4].id },
)

Group::Basic.seed(:name, :parent_id,
  {name: 'Tschutter',
   parent_id: basics[0].id },

  {name: 'Angestellte',
   parent_id: basics[1].id },
)


Group.rebuild!
