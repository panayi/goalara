class CreateOrganizationsTeamsJoin < ActiveRecord::Migration
  def self.up
    create_table :organizations_teams, :id => false do |t|
      t.integer :organization_id
      t.integer :team_id
    end
  end

  def self.down
    drop_table :organizations_teams
  end
end
