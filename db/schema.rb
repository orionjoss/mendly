# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_05_052825) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "title"
    t.string "genre"
    t.text "description"
    t.string "author"
    t.date "release_date"
    t.integer "episode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "list_recommendations", force: :cascade do |t|
    t.bigint "recommendation_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_recommendations_on_list_id"
    t.index ["recommendation_id"], name: "index_list_recommendations_on_recommendation_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "recommendation_id", null: false
    t.bigint "user_id", null: false
    t.bigint "chatroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "gpt_response"
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["recommendation_id"], name: "index_messages_on_recommendation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "giver_id", null: false
    t.bigint "receiver_id", null: false
    t.bigint "item_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["giver_id"], name: "index_recommendations_on_giver_id"
    t.index ["item_id"], name: "index_recommendations_on_item_id"
    t.index ["receiver_id"], name: "index_recommendations_on_receiver_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "categories"
  add_foreign_key "list_recommendations", "lists"
  add_foreign_key "list_recommendations", "recommendations"
  add_foreign_key "lists", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "recommendations"
  add_foreign_key "messages", "users"
  add_foreign_key "recommendations", "items"
  add_foreign_key "recommendations", "users", column: "giver_id"
  add_foreign_key "recommendations", "users", column: "receiver_id"
end
