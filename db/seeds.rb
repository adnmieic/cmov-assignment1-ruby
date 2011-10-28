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
specialty2 = Specialty.create(:name => 'Imunologia')
specialty3 = Specialty.create(:name => 'Neurologia')
specialty4 = Specialty.create(:name => 'Reumatologia')
specialty5 = Specialty.create(:name => 'Cirurgia')
specialty6 = Specialty.create(:name => 'Urologia')
specialty7 = Specialty.create(:name => 'Cardiologia')
specialty8 = Specialty.create(:name => 'Dermatologia')
specialty9 = Specialty.create(:name => 'Pediatria')
specialty10 = Specialty.create(:name => 'Oncologia')
specialty11 = Specialty.create(:name => 'Anastesiologia')
specialty12 = Specialty.create(:name => 'Radiologia')
specialty13 = Specialty.create(:name => 'Oftalmologia')
specialty14 = Specialty.create(:name => 'Otorrinolaringologia')
specialty15 = Specialty.create(:name => 'Ortopedia')

doctor1 = Doctor.create(:username => 'nuno',
						:password => '123',
						:password_confirmation => '123',
            :birthdate => '1988-08-08',
						:name => 'Nuno Silva')
doctor1.specialties.push(specialty1)
doctor1.specialties.push(specialty2)

doctor2 = Doctor.create(:username => 'diogo',
						:password => '123',
						:password_confirmation => '123',
            :birthdate => '1988-08-08',
						:name => 'Diogo Costa')
doctor2.specialties.push(specialty1)
doctor2.specialties.push(specialty2)

doctor3 = Doctor.create(:username => 'andre',
						:password => '123',
						:password_confirmation => '123',
            :birthdate => '1980-09-06',
						:name => 'Andre Fernandes')
doctor3.specialties.push(specialty3)
doctor3.specialties.push(specialty4)

doctor4 = Doctor.create(:username => 'rodolfo',
						:password => '123',
						:password_confirmation => '123',
            :birthdate => '1989-12-25',
						:name => 'Rodolfo Silva')
doctor4.specialties.push(specialty5)
doctor4.specialties.push(specialty6)

doctor5 = Doctor.create(:username => 'miguel',
						:password => '123',
						:password_confirmation => '123',
            :birthdate => '1989-12-25',
						:name => 'Miguel Nabuco')
doctor5.specialties.push(specialty7)
doctor5.specialties.push(specialty8)

doctor6 = Doctor.create(:username => 'francisco',
						:password => '123',
						:password_confirmation => '123',
            :birthdate => '1999-02-16',
						:name => 'Francisco Simoes')
doctor6.specialties.push(specialty9)
doctor6.specialties.push(specialty10)


doctor7 = Doctor.create(:username => 'vania',
						:password => '123',
						:password_confirmation => '123',
            :birthdate => '1985-05-31',
						:name => 'Vania Fernandes')
doctor7.specialties.push(specialty11)
doctor7.specialties.push(specialty12)


doctor8 = Doctor.create(:username => 'fabio',
						:password => '123',
						:password_confirmation => '123',
            :birthdate => '1986-04-01',
						:name => 'Fabio Silva')
doctor8.specialties.push(specialty13)
doctor8.specialties.push(specialty14)
doctor8.specialties.push(specialty15)


patient1 = Patient.create(:username => 'samuel',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Samuel Guerra',
            :birthdate => '2001-03-06',
            :address => 'Av. de França 352\n4050-276 Porto\nPortugal',
						:male => true)

patient2 = Patient.create(:username => 'carla',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Carla Morena',
            :birthdate => '1989-02-06',
            :address => 'Av. de França 352\n4050-276 Porto\nPortugal',
						:male => false)

patient3 = Patient.create(:username => 'ines',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Ines Torrado',
            :birthdate => '1970-03-24',
            :address => 'Av. de França 352\n4050-276 Porto\nPortugal',
						:male => false)

patient4 = Patient.create(:username => 'gabriel',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Gabriel Torga',
            :birthdate => '1960-08-14',
            :address => 'Av. de França 352\n4050-276 Porto\nPortugal',
						:male => true)

patient5 = Patient.create(:username => 'antonio',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Antonio Pereira',
            :birthdate => '1974-08-13',
            :address => 'Av. de França 352\n4050-276 Porto\nPortugal',
						:male => true)

patient6 = Patient.create(:username => 'fernanda',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Fernanda Rosario',
            :birthdate => '1980-09-06',
            :address => 'Av. de França 352\n4050-276 Porto\nPortugal',
						:male => false)

schedule_plan1 = SchedulePlan.new
schedule_plan1.start = '2011-10-01'
schedule_plan1.end = '2011-12-31'
schedule_plan1.doctor = doctor1
schedule_plan1.save

schedule_plan2 = SchedulePlan.new
schedule_plan2.start = '2011-10-01'
schedule_plan2.end = '2011-12-31'
schedule_plan2.doctor = doctor2
schedule_plan2.save

schedule_plan3 = SchedulePlan.new
schedule_plan3.start = '2011-10-01'
schedule_plan3.end = '2011-12-31'
schedule_plan3.doctor = doctor3
schedule_plan3.save

schedule_plan4 = SchedulePlan.new
schedule_plan4.start = '2011-10-01'
schedule_plan4.end = '2011-12-31'
schedule_plan4.doctor = doctor4
schedule_plan4.save

schedule_plan5 = SchedulePlan.new
schedule_plan5.start = '2011-10-01'
schedule_plan5.end = '2011-12-31'
schedule_plan5.doctor = doctor5
schedule_plan5.save

schedule_plan6 = SchedulePlan.new
schedule_plan6.start = '2011-10-01'
schedule_plan6.end = '2011-12-31'
schedule_plan6.doctor = doctor6
schedule_plan6.save

schedule_plan7 = SchedulePlan.new
schedule_plan7.start = '2011-10-01'
schedule_plan7.end = '2011-12-31'
schedule_plan7.doctor = doctor7
schedule_plan7.save

schedule_plan8 = SchedulePlan.new
schedule_plan8.start = '2011-10-01'
schedule_plan8.end = '2011-12-31'
schedule_plan8.doctor = doctor8
schedule_plan8.save



schedule1 = Schedule.new
schedule1.weekday = 0
schedule1.start = '08:00'
schedule1.end = '13:00'
schedule1.schedule_plan = schedule_plan1
schedule1.save

schedule2 = Schedule.new
schedule2.weekday = 2
schedule2.start = '08:00'
schedule2.end = '13:00'
schedule2.schedule_plan = schedule_plan1
schedule2.save

schedule3 = Schedule.new
schedule3.weekday = 4
schedule3.start = '08:00'
schedule3.end = '13:00'
schedule3.schedule_plan = schedule_plan1
schedule3.save

schedule4 = Schedule.new
schedule4.weekday = 0
schedule4.start = '08:00'
schedule4.end = '13:00'
schedule4.schedule_plan = schedule_plan2
schedule4.save

schedule5 = Schedule.new
schedule5.weekday = 4
schedule5.start = '08:00'
schedule5.end = '13:00'
schedule5.schedule_plan = schedule_plan2
schedule5.save

schedule6 = Schedule.new
schedule6.weekday = 0
schedule6.start = '08:00'
schedule6.end = '13:00'
schedule6.schedule_plan = schedule_plan3
schedule6.save

schedule7 = Schedule.new
schedule7.weekday = 4
schedule7.start = '08:00'
schedule7.end = '13:00'
schedule7.schedule_plan = schedule_plan3
schedule7.save

schedule8 = Schedule.new
schedule8.weekday = 0
schedule8.start = '08:00'
schedule8.end = '13:00'
schedule8.schedule_plan = schedule_plan4
schedule8.save

schedule9 = Schedule.new
schedule9.weekday = 4
schedule9.start = '08:00'
schedule9.end = '13:00'
schedule9.schedule_plan = schedule_plan4
schedule9.save

schedule10 = Schedule.new
schedule10.weekday = 0
schedule10.start = '08:00'
schedule10.end = '13:00'
schedule10.schedule_plan = schedule_plan5
schedule10.save

schedule11 = Schedule.new
schedule11.weekday = 4
schedule11.start = '08:00'
schedule11.end = '13:00'
schedule11.schedule_plan = schedule_plan5
schedule11.save

schedule12 = Schedule.new
schedule12.weekday = 0
schedule12.start = '08:00'
schedule12.end = '13:00'
schedule12.schedule_plan = schedule_plan6
schedule12.save

schedule13 = Schedule.new
schedule13.weekday = 4
schedule13.start = '08:00'
schedule13.end = '13:00'
schedule13.schedule_plan = schedule_plan6
schedule13.save

schedule14 = Schedule.new
schedule14.weekday = 0
schedule14.start = '08:00'
schedule14.end = '13:00'
schedule14.schedule_plan = schedule_plan7
schedule14.save

schedule15 = Schedule.new
schedule15.weekday = 4
schedule15.start = '08:00'
schedule15.end = '13:00'
schedule15.schedule_plan = schedule_plan7
schedule15.save

schedule16 = Schedule.new
schedule16.weekday = 0
schedule16.start = '08:00'
schedule16.end = '13:00'
schedule16.schedule_plan = schedule_plan8
schedule16.save

schedule17 = Schedule.new
schedule17.weekday = 4
schedule17.start = '08:00'
schedule17.end = '13:00'
schedule17.schedule_plan = schedule_plan8
schedule17.save


appointment1 = Appointment.new
appointment1.date = '2011-11-02 10:30:00'
appointment1.duration = 30
appointment1.doctor = doctor1
appointment1.patient = patient1
appointment1.save

appointment2 = Appointment.new
appointment2.date = '2011-11-02 11:00:00'
appointment2.duration = 30
appointment2.doctor = doctor1
appointment2.patient = patient2
appointment2.save

appointment3 = Appointment.new
appointment3.date = '2011-11-02 11:30:00'
appointment3.duration = 30
appointment3.doctor = doctor1
appointment3.patient = patient3
appointment3.save

appointment4 = Appointment.new
appointment4.date = '2011-11-02 12:00:00'
appointment4.duration = 30
appointment4.doctor = doctor1
appointment4.patient = patient4
appointment4.save

appointment5 = Appointment.new
appointment5.date = '2011-11-04 10:00:00'
appointment5.duration = 30
appointment5.doctor = doctor2
appointment5.patient = patient1
appointment5.save

appointment6 = Appointment.new
appointment6.date = '2011-11-04 10:00:00'
appointment6.duration = 30
appointment6.doctor = doctor3
appointment6.patient = patient2
appointment6.save

appointment7 = Appointment.new
appointment7.date = '2011-11-04 10:00:00'
appointment7.duration = 30
appointment7.doctor = doctor4
appointment7.patient = patient3
appointment7.save

appointment8 = Appointment.new
appointment8.date = '2011-11-04 10:00:00'
appointment8.duration = 30
appointment8.doctor = doctor5
appointment8.patient = patient4
appointment8.save

appointment9 = Appointment.new
appointment9.date = '2011-11-04 10:00:00'
appointment9.duration = 30
appointment9.doctor = doctor6
appointment9.patient = patient5
appointment9.save

appointment10 = Appointment.new
appointment10.date = '2011-11-04 10:00:00'
appointment10.duration = 30
appointment10.doctor = doctor7
appointment10.patient = patient5
appointment10.save

appointment11 = Appointment.new
appointment11.date = '2011-11-04 10:00:00'
appointment11.duration = 30
appointment11.doctor = doctor8
appointment11.patient = patient6
appointment11.save



