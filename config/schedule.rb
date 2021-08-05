# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

job_type :rbenv_runner, %Q{export PATH=$HOME/.rbenv/bin:$PATH; eval "$(rbenv init -)"; cd :path && bundle exec rails runner -e development :task --silent :output }

every 1.day, at: '1:38 pm' do
  rbenv_runner "OccupancyReportGenerator.generate", environment: 'development'
end

# Learn more: http://github.com/javan/whenever
