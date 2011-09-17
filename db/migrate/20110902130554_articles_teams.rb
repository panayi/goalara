class ArticlesTeams < ActiveRecord::Migration
  def self.up
    create_table :articles_teams, :id => false do |t|
      t.references :article
      t.references :team
    end
  end

  def self.down
    drop_table :articles_teams
  end
end
