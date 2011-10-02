class SchedulePlan < ActiveRecord::Base
	belongs_to :doctor
	has_many :schedules
end
