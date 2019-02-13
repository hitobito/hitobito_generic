# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

class Group::Region < Group

  self.layer = true
  self.event_types = [Event, Event::Course]
  self.default_children = [Group::RegionBoard,
                           Group::RegionOffice,
                           Group::RegionContacts,
                           Group::RegionMembers]

  children Group::RegionBoard, Group::RegionOffice, Group::RegionCommittee, Group::RegionMembers,
           Group::RegionContacts, Group::Region, Group::Local

  class Administrator < Role
    self.permissions = [:layer_and_below_full, :contact_data, :finance]
  end

  roles Administrator
end
