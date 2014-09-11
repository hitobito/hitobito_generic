# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

desc 'Crawl app with tarantula (run in wagon)'
task :tarantula do
  sh 'rm -rf ../hitobito/tmp/tarantula'
  sh 'bash -c "RAILS_ENV=test ../hitobito/bin/with_mysql ' \
     'rake app:tarantula:test -t"'
end
