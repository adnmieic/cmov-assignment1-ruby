class Schedule < ActiveRecord::Base
  belongs_to :schedule_plan

  def as_json(options = {})
    options = { :only => [:id, :weekday, :start, :end, :schedule_plan_id] }
    super(options)
  end
end
