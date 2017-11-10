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

ActiveRecord::Schema.define(version: 20171109135512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "profile_picture"
    t.string   "description"
    t.string   "currency"
    t.date     "birthday"
    t.boolean  "active",          default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["user_id"], name: "index_authors_on_user_id", using: :btree
  end

  create_table "book_transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["book_id"], name: "index_book_transactions_on_book_id", using: :btree
    t.index ["user_id"], name: "index_book_transactions_on_user_id", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.integer  "price"
    t.string   "title"
    t.string   "synopsys"
    t.string   "genre"
    t.string   "cover_pic"
    t.string   "publisher"
    t.date     "publication_year"
    t.integer  "author_id"
    t.boolean  "active",           default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "author_name"
    t.index ["author_id"], name: "index_books_on_author_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "profile_picture"
    t.string   "description"
    t.string   "prefered_genre"
    t.string   "currency"
    t.date     "birthday"
    t.integer  "user_id"
    t.boolean  "active",          default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["user_id"], name: "index_clients_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.boolean  "is_author",              default: false
    t.boolean  "admin",                  default: false
    t.boolean  "active",                 default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "authors", "users"
  add_foreign_key "book_transactions", "books"
  add_foreign_key "book_transactions", "users"
  add_foreign_key "books", "authors"
  add_foreign_key "clients", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
