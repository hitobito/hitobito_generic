# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

module Group::Generic
  extend ActiveSupport::Concern

  included do
    # define global roles before children
    # roles Role::AddressAdmin,
    #       Role::DispatchAddress,
    #       Role::External

    # define global children

    root_types Group::TopLayer
  end
end
