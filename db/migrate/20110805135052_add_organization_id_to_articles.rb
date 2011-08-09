class AddOrganizationIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :organization_id, :integer
  end

  def self.down
    remove_column :articles, :organization_id, :integer
  end
end
