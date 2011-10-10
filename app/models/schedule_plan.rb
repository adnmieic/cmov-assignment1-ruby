class SchedulePlan < ActiveRecord::Base
  belongs_to :doctor
  has_many :schedules
  
  def as_json(options = {})
    options = { :only => [:start, :end] }
    super(options)
  end
end
