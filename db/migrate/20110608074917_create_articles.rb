class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.string :category
      t.string :url
      t.string :published_at
      t.string :guid
      t.integer :feed_id
      t.text :tf_idf_content
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
