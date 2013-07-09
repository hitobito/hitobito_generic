
desc "Crawl app with tarantula (run in wagon)"
task :tarantula do
  sh 'rm -rf ../hitobito/tmp/tarantula'
  sh 'bash -c "RAILS_ENV=test ../hitobito/script/with_mysql rake db:test:prepare app:tarantula:test -t"'
end