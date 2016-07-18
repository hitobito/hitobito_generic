# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

class Group::RegionOffice < Group::Office

  class Manager < Role::OfficeManager
  end

  class Staff < Role::OfficeStaff
  end

  roles Manager, Staff
end
