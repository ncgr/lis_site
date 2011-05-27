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

ActiveRecord::Schema.define(:version => 0) do

  create_table "development_activities", :force => true do |t|
    t.text   "body"
    t.string "date"
  end

  create_table "legumes", :force => true do |t|
    t.string "name",       :null => false
    t.string "short_name", :null => false
  end

  add_index "legumes", ["name"], :name => "name_UNIQUE", :unique => true
  add_index "legumes", ["short_name"], :name => "short_name_UNIQUE", :unique => true

  create_table "lotja_contents", :force => true do |t|
    t.text     "overview"
    t.string   "season"
    t.string   "economic_type"
    t.text     "economic_importance"
    t.text     "scientific_importance"
    t.string   "origin_lat"
    t.string   "origin_long"
    t.string   "nodulation_type"
    t.text     "nodulation_information"
    t.string   "nodulator_species"
    t.string   "nodulator_taxon_id"
    t.string   "flowering_type"
    t.text     "flowering_information"
    t.string   "pollination_type"
    t.text     "pollination_information"
    t.string   "self_incompatibility"
    t.string   "inbreeding"
    t.string   "wiki_link"
    t.text     "genome_summary"
    t.string   "chromosomes"
    t.string   "genome_size"
    t.string   "ploidy"
    t.string   "ploidy_type"
    t.string   "gc_content_genome"
    t.string   "gc_content_transcriptome"
    t.string   "chloroplast_genome_size"
    t.string   "chloroplast_accession_number"
    t.string   "mitochondria_genome_size"
    t.string   "mitochondria_accession_number"
    t.text     "resources"
    t.text     "selected_references"
    t.string   "file_name"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "legume_id",                     :null => false
  end

  create_table "medtr_contents", :force => true do |t|
    t.text     "overview"
    t.text     "genome_summary"
    t.text     "resources"
    t.text     "selected_references"
    t.string   "file_name"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "meetings", :force => true do |t|
    t.string "title"
    t.string "url"
    t.date   "start_date"
    t.date   "end_date"
  end

  create_table "news_articles", :force => true do |t|
    t.string    "title",     :null => false
    t.text      "body"
    t.timestamp "timestamp", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "pages", ["title"], :name => "title_UNIQUE", :unique => true

  create_table "pathogens", :force => true do |t|
    t.integer "legume_id",     :null => false
    t.string  "name"
    t.string  "ncbi_taxon_id"
  end

  create_table "phavu_contents", :force => true do |t|
    t.text     "overview"
    t.text     "genome_summary"
    t.text     "resources"
    t.text     "selected_references"
    t.string   "file_name"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "user_roles", :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "role_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                                           :null => false
    t.string   "encrypted_password",   :limit => 128,                :null => false
    t.string   "password_salt",                                      :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "invitation_token",     :limit => 60
    t.datetime "invitation_sent_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
