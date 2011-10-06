class Doctor < User
  has_many :appointments
  has_many :patients, :through => :appointments
  has_many :schedule_plans
  
  has_and_belongs_to_many :specialties
end
