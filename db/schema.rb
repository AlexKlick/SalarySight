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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_023_154_212) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'posts', force: :cascade do |t|
    t.string 'company'
    t.integer 'salary'
    t.string 'degree'
    t.string 'position_title'
    t.string 'state'
    t.integer 'job_hunt_duration'
    t.integer 'years_of_experience'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'grad_year'
    t.bigint 'user_id'
    t.string 'username'
    t.integer 'program'
    t.string 'position_company'
    t.integer 'type_of_employment'
    t.string 'gender'
    t.integer 'first_position'
    t.integer 'location_of_employment'
    t.string 'negotiation'
    t.string 'age'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'salaries', force: :cascade do |t|
    t.integer 'salary'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'date'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'nickname'
    t.string 'email'
    t.string 'image_url'
    t.string 'token'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'posts', 'users'
end
