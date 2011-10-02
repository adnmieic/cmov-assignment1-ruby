class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :duration
      t.references :patient
      t.references :doctor

      t.timestamps
    end
    add_index :appointments, :patient_id
    add_index :appointments, :doctor_id
  end
end
