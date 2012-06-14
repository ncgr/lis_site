#
# Rake tasks
#

namespace :db do
  desc "Delete meetings where end_date > today."
  task :delete_meetings => :environment do
    # Today
    today = Time.now.to_i

    @meetings = Meeting.all
    num = 0

    @meetings.each do |m|
      date = m.end_date.to_time.to_i
      if today > date
        Meeting.destroy(m.id)
        num += 1
      end
    end
    puts "#{Time.now}: Deleted #{num} meeting(s) in the database."
  end
end

namespace :session do
  desc "Delete stale sessions where last updated > 1 hour ago."
  task :delete_sessions => :environment do
    num = Session.sweep
    puts "#{Time.now}: Deleted #{num} session(s) in the database."
  end
end

