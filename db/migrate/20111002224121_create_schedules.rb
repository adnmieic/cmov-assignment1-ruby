class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :weekday
      t.time :start
      t.time :end
      t.references :schedule_plan

      t.timestamps
    end
    add_index :schedules, :schedule_plan_id
  end
end
