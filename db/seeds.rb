# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clinic = ClinicInfo.create(:id => 1,
                           :name => "Medical Clinic",
                           :lat => 41.160244, 
                           :lon => -8.628296,
                           :email => "admin@medicalclinic.com",
                           :phone => "228 349 350",
                           :address => "Av. de França 352\n4050-276 Porto\nPortugal")

root = User.create(:id => 1, 
                   :username => 'root', 
                   :password => 'toor',
                   :password_confirmation => 'toor',
                   :name => 'Root', 
                   :birthdate => '2011-10-02',
                   :address => '', 
                   :male => true,
                   :type => 'User')

specialty1 = Specialty.create(:name => 'Psicologia Clinica')
specialty2 = Specialty.create(:name => 'Pediatria')

doctor1 = Doctor.create(:username => 'nuno',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Nuno Silva',
						:photo => nil)
						
doctor1.specialties.push(specialty1)
doctor1.specialties.push(specialty2)

doctor2 = Doctor.create(:username => 'diogo',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Diogo Costa',
						:photo => nil)

doctor2.specialties.push(specialty1)

patient1 = Patient.create(:username => 'andre',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Andre Fernandes',
            :birthdate => '1980-09-06',
            :address => 'Porto',
						:male => true)

appointment1 = Appointment.new
appointment1.date = '2011-10-10 20:30:00'
appointment1.duration = 30
appointment1.doctor = doctor1
appointment1.patient = patient1
appointment1.save

appointment2 = Appointment.new
appointment2.date = '2011-10-10 20:30:00'
appointment2.duration = 30
appointment2.doctor = doctor2
appointment2.patient = patient1
appointment2.save

schedule_plan1 = SchedulePlan.new
schedule_plan1.start = '2011-10-15'
schedule_plan1.end = '2011-10-30'
schedule_plan1.doctor = doctor1
schedule_plan1.save

schedule1 = Schedule.new
schedule1.weekday = 1
schedule1.start = '10:00'
schedule1.end = '12:30'
schedule1.schedule_plan = schedule_plan1
schedule1.save


