# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

namespace :app do
  namespace :license do
    task :config do
      @licenser = Licenser.new('hitobito_generic',
                               'Puzzle ITC GmbH',
                               'https://github.com/hitobito/hitobito_generic')
    end
  end
end
