class DoctorSpecialty < ActiveRecord::Migration
  def up
	create_table :doctor_specialties do |t|
		t.integer :doctor_id
		t.integer :specialty_id
	end
  end

  def down
	drop_table :doctor_specialties
  end
end
