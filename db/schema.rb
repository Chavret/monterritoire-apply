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

ActiveRecord::Schema[7.0].define(version: 2023_01_30_172006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communes", force: :cascade do |t|
    t.bigint "intercommunality_id"
    t.string "name", null: false
    t.string "code_insee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "population"
    t.index ["intercommunality_id"], name: "index_communes_on_intercommunality_id"
  end

  create_table "intercommunalities", force: :cascade do |t|
    t.string "name"
    t.string "siren"
    t.string "form"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "street_communes", force: :cascade do |t|
    t.bigint "commune_id", null: false
    t.bigint "street_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_street_communes_on_commune_id"
    t.index ["street_id"], name: "index_street_communes_on_street_id"
  end

  create_table "streets", force: :cascade do |t|
    t.string "title", null: false
    t.integer "from"
    t.integer "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "communes", "intercommunalities"
  add_foreign_key "street_communes", "communes"
  add_foreign_key "street_communes", "streets"
end
