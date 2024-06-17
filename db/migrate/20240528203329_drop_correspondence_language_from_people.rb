# frozen_string_literal: true

#  Copyright (c) 2024-2024, Puzzle ITC. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

class DropCorrespondenceLanguageFromPeople < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up { execute("UPDATE people SET language = COALESCE(correspondence_language, 'de')") }
      dir.down { execute("UPDATE people SET correspondence_language = language") }
    end

    remove_column :people, :correspondence_language, :string
  end
end
