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
