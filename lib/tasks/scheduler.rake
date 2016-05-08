desc "This task is called by the Heroku scheduler add-on"
task :day_generator => :environment do
  User.all.each do |user|
    day = ActiveSupport::TimeZone.new(user.time_zone).now.day
    when_the_last_day_is_created = user.days.order("created_at ASC").last.created_at
    last_day = when_the_last_day_is_created.in_time_zone(user.time_zone).day

    unless day == last_day
      user.days.create
    end
  end
end