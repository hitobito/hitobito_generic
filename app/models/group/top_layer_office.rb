#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

class Group::TopLayerOffice < Group::Office
  class Manager < Role::OfficeManager
  end

  class Staff < Role::OfficeStaff
  end

  class Treasurer < Role::Treasurer
    self.permissions = [:layer_and_below_full, :contact_data, :finance]
  end

  self.standard_role = Staff
  roles Manager, Treasurer, Staff
end
