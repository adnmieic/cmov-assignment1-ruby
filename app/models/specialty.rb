class Specialty < ActiveRecord::Base
	belongs_to :clinic
	has_many :doctor_specialties
	has_many :doctors, :through => :doctor_specialties
end
