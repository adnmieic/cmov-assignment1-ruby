class DoctorSpecialty < User
	belongs_to :doctor
	belongs_to :specialty
end
