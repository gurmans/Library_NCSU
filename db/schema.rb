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

ActiveRecord::Schema.define(version: 2019_09_30_213746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "book_histories", force: :cascade do |t|
    t.date "issueDate"
    t.date "returnDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "book_id"
    t.bigint "student_id"
    t.index ["book_id"], name: "index_book_histories_on_book_id"
    t.index ["student_id"], name: "index_book_histories_on_student_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "ISBN"
    t.string "title"
    t.string "Author"
    t.string "language"
    t.string "published"
    t.string "edition"
    t.string "image"
    t.text "summary"
    t.boolean "specialCollection"
    t.date "returnDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.bigint "library_id"
    t.index ["library_id"], name: "index_books_on_library_id"
    t.index ["student_id"], name: "index_books_on_student_id"
  end

  create_table "librarians", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "email"
    t.string "bookmarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "library_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_librarians_on_email", unique: true
    t.index ["library_id"], name: "index_librarians_on_library_id"
    t.index ["reset_password_token"], name: "index_librarians_on_reset_password_token", unique: true
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "bookBorrowingDaysLimit"
    t.decimal "overdueFine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "university_id"
    t.index ["university_id"], name: "index_libraries_on_university_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.integer "maxNumberOfBooksIssuable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "token"
    t.datetime "expirationTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "email"
    t.string "bookmarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "program_id"
    t.bigint "university_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["program_id"], name: "index_students_on_program_id"
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["university_id"], name: "index_students_on_university_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_histories", "books"
  add_foreign_key "book_histories", "students"
  add_foreign_key "books", "libraries"
  add_foreign_key "books", "students"
  add_foreign_key "librarians", "libraries"
  add_foreign_key "libraries", "universities"
  add_foreign_key "students", "programs"
  add_foreign_key "students", "universities"
end
