#  Copyright (c) 2018, hitobito AG. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

class Role::AddressManager < Role
  self.permissions = [:group_and_below_full]
end
