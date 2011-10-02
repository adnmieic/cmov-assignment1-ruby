class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :duration
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
