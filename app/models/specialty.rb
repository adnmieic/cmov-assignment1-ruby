class Specialty < ActiveRecord::Base
	has_many :doctor_specialties
	has_many :doctors, :through => :doctor_specialties
end
