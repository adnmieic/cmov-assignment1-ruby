class Patient < User
	has_many :appointments
	has_many :doctors, :through => :appointments
end
