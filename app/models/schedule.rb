class Schedule < ActiveRecord::Base
  belongs_to :schedule_plan

  def as_json(options = {})
    options = { :only => [:id, :weekday, :start, :end] }
    super(options)
  end
end
