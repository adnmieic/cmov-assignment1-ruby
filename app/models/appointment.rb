class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  
  def as_json(options = {})
    options = { :only => [:date, :duration] }
    super(options)
  end
end
