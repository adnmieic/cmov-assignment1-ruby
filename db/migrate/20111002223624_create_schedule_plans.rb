class CreateSchedulePlans < ActiveRecord::Migration
  def change
    create_table :schedule_plans do |t|
      t.date :start
      t.date :end
      t.references :doctor

      t.timestamps
    end
    add_index :schedule_plans, :doctor_id
  end
end
