#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

class Group::Local < Group
  self.layer = true
  self.event_types = [Event]
  self.default_children = []

  children Group::LocalBoard, Group::LocalOffice, Group::LocalCommittee,
    Group::LocalMembers, Group::LocalContacts

  class MainLeader < Role
    self.permissions = [:layer_and_below_full]
  end

  class AddressManager < Role
    self.permissions = [:group_and_below_full, :impersonation]
  end

  class Leader < Role::Leader
  end

  class ActiveMember < Role::ActiveMember
    self.permissions = [:group_and_below_read]
  end

  self.standard_role = ActiveMember
  roles MainLeader, AddressManager, Leader, ActiveMember
end
