# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

require Rails.root.join('db', 'seeds', 'support', 'event_seeder')

srand(42)

seeder = EventSeeder.new

seeder.course_group_ids.each do |group_id|
  10.times do
    seeder.seed_event(group_id, :course)
    seeder.seed_event(group_id, :base)
  end
end


