# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

root = User.create(:id => 1, 
                   :username => 'root', 
                   :password => 'toor',
                   :password_confirmation => 'toor',
                   :name => 'Root', 
                   :birthdate => '2011-10-02',
                   :address => '', 
                   :male => true,
                   :type => 'User')

doctor1 = Doctor.create(:username => 'nuno',
						:password => '123',
						:password_confirmation => '123',
						:name => 'Nuno Silva',
						:male => true,
						:photo => nil)
						
Specialty.create(:name => 'Psicologia Clinica')
Specialty.create(:name => 'Pediatria')

