#  Copyright (c) 2012-2019, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

module Generic::Person
  extend ActiveSupport::Concern

  included do
    Person::PUBLIC_ATTRS << :title << :additional_languages << :advertising

    ADVERTISINGS = %w[none by_members by_anyone].freeze

    i18n_enum :advertising, ADVERTISINGS
    i18n_setter :advertising, ADVERTISINGS
  end
end
