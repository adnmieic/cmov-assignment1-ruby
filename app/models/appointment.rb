class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  
  def as_json(options = {})
    options = { :only => [:id, :date, :duration, :patient_id, :doctor_id] }
    hash = super(options)
    hash[:patient_name] = get_patient_name()
    hash[:doctor_name] = get_doctor_name()
    hash
  end

  def get_patient_name
    @patient = Patient.find(self.patient_id)
    return @patient.name
  end

  def get_doctor_name
    @doctor = Doctor.find(self.doctor_id)
    return @doctor.name
  end

end
