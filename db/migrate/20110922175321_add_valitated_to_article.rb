class AddValitatedToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :validated, :boolean, :default => 0
  end

  def self.down
    remove_column :articles, :validated
  end
end
