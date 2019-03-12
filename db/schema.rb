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

ActiveRecord::Schema.define(version: 2019_03_08_133051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cultures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "culture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["culture_id"], name: "index_domains_on_culture_id"
  end

  create_table "group_students", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_students_on_group_id"
    t.index ["student_id"], name: "index_group_students_on_student_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "scholar_year_id"
    t.index ["scholar_year_id"], name: "index_groups_on_scholar_year_id"
  end

  create_table "scholar_years", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.boolean "current", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_students", force: :cascade do |t|
    t.bigint "section_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_section_students_on_section_id"
    t.index ["student_id"], name: "index_section_students_on_student_id"
  end

  create_table "sections", force: :cascade do |t|
    t.integer "year_start", null: false
    t.integer "level", null: false
    t.string "sub_section", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year_end"
    t.bigint "scholar_year_id"
    t.index ["scholar_year_id"], name: "index_sections_on_scholar_year_id"
  end

  create_table "skill_students", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "student_id"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "work_session_id"
    t.index ["section_id"], name: "index_skill_students_on_section_id"
    t.index ["skill_id"], name: "index_skill_students_on_skill_id"
    t.index ["student_id"], name: "index_skill_students_on_student_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "domain_id"
    t.index ["domain_id"], name: "index_skills_on_domain_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string "name"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_work_sessions", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "work_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "attended", default: true
    t.boolean "suspended", default: false
    t.boolean "medical", default: false
    t.boolean "late", default: false
    t.index ["student_id"], name: "index_student_work_sessions_on_student_id"
    t.index ["work_session_id"], name: "index_student_work_sessions_on_work_session_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_work_sessions", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "work_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_teacher_work_sessions_on_teacher_id"
    t.index ["work_session_id"], name: "index_teacher_work_sessions_on_work_session_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_session_skills", force: :cascade do |t|
    t.bigint "work_session_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_work_session_skills_on_skill_id"
    t.index ["work_session_id"], name: "index_work_session_skills_on_work_session_id"
  end

  create_table "work_session_subjects", force: :cascade do |t|
    t.bigint "work_session_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_work_session_subjects_on_subject_id"
    t.index ["work_session_id"], name: "index_work_session_subjects_on_work_session_id"
  end

  create_table "work_sessions", force: :cascade do |t|
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "scholar_year_id"
    t.bigint "slot_id"
    t.index ["scholar_year_id"], name: "index_work_sessions_on_scholar_year_id"
    t.index ["slot_id"], name: "index_work_sessions_on_slot_id"
  end

  add_foreign_key "domains", "cultures"
  add_foreign_key "group_students", "groups"
  add_foreign_key "group_students", "students"
  add_foreign_key "groups", "scholar_years"
  add_foreign_key "section_students", "sections"
  add_foreign_key "section_students", "students"
  add_foreign_key "sections", "scholar_years"
  add_foreign_key "skill_students", "sections"
  add_foreign_key "skill_students", "skills"
  add_foreign_key "skill_students", "students"
  add_foreign_key "skills", "domains"
  add_foreign_key "student_work_sessions", "students"
  add_foreign_key "student_work_sessions", "work_sessions"
  add_foreign_key "teacher_work_sessions", "teachers"
  add_foreign_key "teacher_work_sessions", "work_sessions"
  add_foreign_key "work_session_skills", "skills"
  add_foreign_key "work_session_skills", "work_sessions"
  add_foreign_key "work_session_subjects", "subjects"
  add_foreign_key "work_session_subjects", "work_sessions"
  add_foreign_key "work_sessions", "scholar_years"
end
