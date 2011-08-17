class AddAvatarAndNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar, :string
    add_column :users, :fullname, :string
  end

  def self.down
    remove_column :users, :avatar
    remove_column :fullname, :avatar
  end
end
