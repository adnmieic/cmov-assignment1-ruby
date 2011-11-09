class SchedulePlan < ActiveRecord::Base
  belongs_to :doctor
  has_many :schedules
  before_create :check_for_appointments
  after_save :correct_other_plans, :unless => :skip_callbacks

  @@skipcallbacks = false

  def skip_callbacks
    return @@skipcallbacks
  end

  def check_for_appointments
    appointment = Appointment.find(:first, :conditions => ["DATE(date) >= ? AND doctor_id = ?", self.start, self.doctor_id])

    if appointment
      self.errors.add(:start, "Appointments are already scheduled after this date.")
      return false
    end

    if self.end && self.end < self.start
      self.errors.add(:end, "End date cannot be before start date!")
      return false
    end
    true
  end

  def correct_other_plans
    schedule_plans = SchedulePlan.find(:all, :conditions => ["doctor_id = ? AND id <> ? AND (schedule_plans.end IS NULL OR DATE(schedule_plans.end) >= ?)", self.doctor_id, self.id, self.start])

    @@skipcallbacks = true

    schedule_plans.each do |schedule_plan|
      schedule_plan.end = self.start.yesterday;
      schedule_plan.save
    end

    @@skipcallbacks = false
  end

  def as_json(options = {})
    options = { :only => [:id, :start, :end, :doctor_id] }
    super(options)
  end
end
