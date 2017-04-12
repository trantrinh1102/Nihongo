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

ActiveRecord::Schema.define(version: 20170412094413) do

  create_table "anwers", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "content"
    t.boolean  "is_correct"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_anwers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "grammars", force: :cascade do |t|
    t.integer  "lesson_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_grammars_on_lesson_id"
  end

  create_table "kanjis", force: :cascade do |t|
    t.integer  "lesson_id"
    t.string   "character"
    t.string   "vietnamese"
    t.string   "romaji"
    t.string   "example"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_kanjis_on_lesson_id"
  end

  create_table "lesson_tests", force: :cascade do |t|
    t.integer  "test_id"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_tests_on_lesson_id"
    t.index ["test_id"], name: "index_lesson_tests_on_test_id"
  end

  create_table "lesson_vocabularies", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "vocabulary_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["lesson_id"], name: "index_lesson_vocabularies_on_lesson_id"
    t.index ["vocabulary_id"], name: "index_lesson_vocabularies_on_vocabulary_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_lessons_on_category_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "test_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_results_on_test_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "gender"
    t.string   "avartar"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "videos", force: :cascade do |t|
    t.integer  "lesson_id"
    t.string   "link"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["lesson_id"], name: "index_videos_on_lesson_id"
  end

  create_table "vocabularies", force: :cascade do |t|
    t.string   "japanese"
    t.string   "vietnamese"
    t.string   "romaji"
    t.string   "audio_link"
    t.string   "image_link"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
