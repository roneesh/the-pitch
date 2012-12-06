# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121206233345) do

  create_table "attachments", :force => true do |t|
    t.integer  "pitch_id"
    t.string   "resource_url"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "employers", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "email"
  end

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "employer_id"
    t.string   "contact_email"
    t.integer  "maxpitchcount", :default => 1000
  end

  create_table "pitch_attachments", :force => true do |t|
    t.integer  "pitch_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "attachment"
    t.string   "name"
    t.string   "description"
  end

  create_table "pitches", :force => true do |t|
    t.string   "headline"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "profilepic_file_name"
    t.string   "profilepic_content_type"
    t.integer  "profilepic_file_size"
    t.datetime "profilepic_updated_at"
    t.string   "short_url"
    t.boolean  "viewed"
    t.string   "url_string"
    t.string   "video_link"
    t.string   "avatar"
    t.string   "resume"
    t.text     "user_story"
  end

  create_table "prompts", :force => true do |t|
    t.integer  "pitch_id"
    t.string   "custom_answer"
    t.string   "custom_question"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "linkedin_script"
  end

end
