# encoding: utf-8

#  Copyright (c) 2012-2019, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

class AddPersonFields < ActiveRecord::Migration
  def change
    add_column(:people, :title, :string)
    add_column(:people, :nationality, :string)
    add_column(:people, :correspondence_language, :string)
    add_column(:people, :additional_languages, :string)
    add_column(:people, :advertising, :string)
  end
end
