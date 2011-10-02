class CreateDoctorsSpecialtiesJoinTable < ActiveRecord::Migration
  def up
		create_table :doctors_specialties, :id => false do |t|
			t.references :doctor, :null => false
			t.references :specialty, :null => false
		end
		add_index :doctors_specialties, :doctor_id
		add_index :doctors_specialties, :specialty_id 
  end
end
