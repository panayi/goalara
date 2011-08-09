class AddImageToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :image, :string
  end

  def self.down
    remove_column :articles, :image, :string
  end
end
