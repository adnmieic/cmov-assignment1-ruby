class AddPhotoColumnsToDoctor < ActiveRecord::Migration
  def self.up
    remove_column :users, :photo
    add_column :users, :photo_file_name, :string
    add_column :users, :photo_content_type, :string
    add_column :users, :photo_file_size, :string
    add_column :users, :photo_updated_at, :string
  end

  def self.down
    add_column :users, :photo, :string
    remove_column :users, :photo_file_name
    remove_column :users, :photo_content_type
    remove_column :users, :photo_file_size
    remove_column :users, :photo_updated_at
  end
end
