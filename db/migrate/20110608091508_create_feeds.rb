class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :feed_url
      t.string :site_name
      t.string :site_url
      t.string :site_logo

      t.timestamps
    end
  end

  def self.down
    drop_table :feeds
  end
end
