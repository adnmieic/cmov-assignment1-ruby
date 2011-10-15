class SchedulePlan < ActiveRecord::Base
  belongs_to :doctor
  has_many :schedules
  
  def as_json(options = {})
    options = { :only => [:id, :start, :end, :doctor_id] }
    super(options)
  end
end
