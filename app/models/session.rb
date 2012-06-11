class Session < ActiveRecord::Base

  #
  # Delete stale sessions.
  #
  # Ex: Session.sweep("15 minutes")
  #
  def self.sweep(time = 1.hour)
    if time.is_a?(String)
      time = time.split.inject { |count, unit| count.to_i.send(unit) }
    end

    delete_all "updated_at < '#{time.ago.to_s(:db)}' OR " <<
      "created_at < '#{2.days.ago.to_s(:db)}'"
  end

end
