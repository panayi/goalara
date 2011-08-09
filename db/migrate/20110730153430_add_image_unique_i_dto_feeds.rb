class AddImageUniqueIDtoFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :image_unique_div, :string
  end

  def self.down
    remove_column :feeds, :image_unique_div, :string
  end
end
