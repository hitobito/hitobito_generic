# encoding: utf-8

#  Copyright (c) 2012-2019, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

module Generic::Person
  extend ActiveSupport::Concern

  included do
    Person::PUBLIC_ATTRS << :title << :correspondence_language << :additional_languages << :advertising

    CORRESPONDENCE_LANGUAGES = %w(de fr it en).freeze
    ADVERTISINGS = %w(none by_members by_anyone).freeze

    i18n_enum :correspondence_language, CORRESPONDENCE_LANGUAGES
    i18n_setter :correspondence_language, CORRESPONDENCE_LANGUAGES

    i18n_enum :advertising, ADVERTISINGS
    i18n_setter :advertising, ADVERTISINGS
  end
end
