class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.date :birthdate
      t.string :photo
      t.string :address
      t.boolean :male

      t.timestamps
    end
  end
end
