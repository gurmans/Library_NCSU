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

ActiveRecord::Schema.define(version: 2019_10_09_213317) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.integer "book_id"
    t.integer "student_id"
    t.date "dueDate"
    t.decimal "overdue_amount"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "library_id"
    t.integer "available"
    t.string "subject"
    t.index ["library_id"], name: "index_books_on_library_id"
    t.index ["student_id"], name: "index_books_on_student_id"
  end

  create_table "hold_book_trackers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "book_id"
    t.index ["book_id"], name: "index_hold_book_trackers_on_book_id"
    t.index ["student_id"], name: "index_hold_book_trackers_on_student_id"
  end

  create_table "librarians", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "email"
    t.string "bookmarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "library_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "approved", default: false
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
    t.integer "university_id"
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
    t.integer "program_id"
    t.integer "university_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.decimal "overdueFromReturnedBooks"
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

end
