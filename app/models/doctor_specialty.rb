class DoctorSpecialty < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :specialty
end
