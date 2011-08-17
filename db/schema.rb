# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110817093641) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.string   "category"
    t.string   "url"
    t.string   "published_at"
    t.string   "guid"
    t.integer  "feed_id"
    t.integer  "team_id"
    t.text     "tf_idf_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "organization_id"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "feeds", :force => true do |t|
    t.string   "feed_url"
    t.string   "site_name"
    t.string   "site_url"
    t.string   "site_logo"
    t.string   "category_unique_div"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_unique_div"
    t.string   "image_unique_div"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations_teams", :id => false, :force => true do |t|
    t.integer "organization_id"
    t.integer "team_id"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "logo_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "fullname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "viewers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
