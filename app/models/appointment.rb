class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  
  def as_json(options = {})
    options = { :only => [:id, :date, :duration, :patient_id, :doctor_id] }
    super(options)
  end
end
