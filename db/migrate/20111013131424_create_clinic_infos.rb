class CreateClinicInfos < ActiveRecord::Migration
  def change
    create_table :clinic_infos do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lon
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
