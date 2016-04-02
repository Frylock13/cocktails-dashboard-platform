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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160401233256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_id"
    t.string   "name"
    t.integer  "likes_count"
    t.integer  "dislikes_count"
    t.integer  "recipes_count"
  end

  add_index "chefs", ["user_id"], name: "index_chefs_on_user_id", using: :btree

  create_table "dislikes", force: :cascade do |t|
    t.integer  "chef_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dislikes", ["chef_id"], name: "index_dislikes_on_chef_id", using: :btree
  add_index "dislikes", ["recipe_id"], name: "index_dislikes_on_recipe_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "chef_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["chef_id"], name: "index_likes_on_chef_id", using: :btree
  add_index "likes", ["recipe_id"], name: "index_likes_on_recipe_id", using: :btree

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
  end

  add_index "recipe_ingredients", ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id", using: :btree
  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id", using: :btree

  create_table "recipe_styles", force: :cascade do |t|
    t.integer "style_id"
    t.integer "recipe_id"
  end

  add_index "recipe_styles", ["recipe_id"], name: "index_recipe_styles_on_recipe_id", using: :btree
  add_index "recipe_styles", ["style_id"], name: "index_recipe_styles_on_style_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "chef_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "likes_count"
    t.integer  "dislikes_count"
  end

  add_index "recipes", ["chef_id"], name: "index_recipes_on_chef_id", using: :btree

  create_table "styles", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "dislikes", "chefs"
  add_foreign_key "dislikes", "recipes"
  add_foreign_key "likes", "chefs"
  add_foreign_key "likes", "recipes"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipe_styles", "recipes"
  add_foreign_key "recipe_styles", "styles"
end
