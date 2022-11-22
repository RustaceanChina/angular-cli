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

ActiveRecord::Schema.define(version: 20170128223205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tweets", force: :cascade do |t|
    t.string   "tweet_id"
    t.text     "text"
    t.string   "category_slug"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "in_use"
    t.boolean  "ignored"
    t.index ["category_slug", "ignored", "in_use"], name: "index_tweets_on_category_slug_and_ignored_and_in_use", using: :btree
    t.index ["tweet_id"], name: "index_tweets_on_tweet_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.text     "name"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  end

end
