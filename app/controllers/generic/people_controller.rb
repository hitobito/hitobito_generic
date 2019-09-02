# encoding: utf-8

#  Copyright (c) 2012-2019, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

module Generic::PeopleController
  extend ActiveSupport::Concern

  included do
    before_render_form :load_titles
    before_render_form :load_nationalities

    self.permitted_attrs += [
      :additional_languages,
      :advertising,
      :correspondence_language,
      :nationality,
      :title
    ]
  end

  private

  def load_titles
    @titles = (Person.pluck(:title).compact + %w(Dr Msc)).uniq.sort
  end

  def load_nationalities
    @nationalities = (Person.pluck(:nationality).compact + %w(Schweiz Deutschland)).uniq.sort
  end
end
