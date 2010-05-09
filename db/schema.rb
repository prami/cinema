# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100508172237) do

  create_table "auditoria", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chairs", :force => true do |t|
    t.integer  "room_id"
    t.integer  "row"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films", :force => true do |t|
    t.string  "title",      :null => false
    t.string  "director",   :null => false
    t.string  "cast",       :null => false
    t.text    "plot",       :null => false
    t.string  "genre",      :null => false
    t.string  "run_time",   :null => false
    t.date    "release"
    t.boolean "version3d"
    t.integer "limitation"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "chairs"
  end

  create_table "showings", :force => true do |t|
    t.integer  "film_id",     :null => false
    t.integer  "room_id",     :null => false
    t.date     "date",        :null => false
    t.time     "time",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
