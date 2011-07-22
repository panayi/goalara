class AddContentUniqueDivToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :content_unique_div, :string
  end

  def self.down
    remove_column :feeds, :content_unique_div
  end
end
