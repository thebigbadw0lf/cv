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

ActiveRecord::Schema.define(:version => 20130312053138) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "min_employees"
    t.integer  "max_employees"
    t.string   "link"
    t.string   "logo_link"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "record_id"
  end

  create_table "descriptions", :force => true do |t|
    t.string   "description_short"
    t.text     "description_long"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "descriptions_schools", :id => false, :force => true do |t|
    t.integer "description_id"
    t.integer "school_id"
  end

  add_index "descriptions_schools", ["description_id"], :name => "index_descriptions_schools_on_description_id"
  add_index "descriptions_schools", ["school_id"], :name => "index_descriptions_schools_on_school_id"

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "industries_companies", :id => false, :force => true do |t|
    t.integer "industry_id"
    t.integer "company_id"
  end

  add_index "industries_companies", ["company_id"], :name => "index_industries_companies_on_company_id"
  add_index "industries_companies", ["industry_id"], :name => "index_industries_companies_on_industry_id"

  create_table "locations", :force => true do |t|
    t.string   "city"
    t.string   "country"
    t.string   "continent"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "street"
  end

  create_table "locations_schools", :id => false, :force => true do |t|
    t.integer "location_id"
    t.integer "school_id"
  end

  add_index "locations_schools", ["location_id"], :name => "index_locations_schools_on_location_id"
  add_index "locations_schools", ["school_id"], :name => "index_locations_schools_on_school_id"

  create_table "records", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "job_title"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "is_current"
  end

  create_table "records_descriptions", :force => true do |t|
    t.integer  "record_id"
    t.integer  "description_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "records_locations", :force => true do |t|
    t.integer  "record_id"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "schools", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name"
    t.string   "degree"
    t.string   "degree_short"
    t.string   "link"
    t.string   "logo_link"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "name_short"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
