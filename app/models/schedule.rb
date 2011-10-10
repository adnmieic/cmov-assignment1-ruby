class Schedule < ActiveRecord::Base
  belongs_to :schedule_plan

  def as_json(options = {})
    options = { :only => [:weekday, :start, :end] }
    super(options)
  end
end
