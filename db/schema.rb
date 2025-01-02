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

ActiveRecord::Schema[8.0].define(version: 2021_03_05_072402) do
  create_table "bugs", force: :cascade do |t|
    t.string "hashid", null: false
    t.text "svg", null: false
    t.text "qrcode", null: false
    t.string "load_identifier", null: false
    t.string "term", null: false
    t.string "language", null: false
    t.string "translation", null: false
    t.text "color_scheme"
    t.string "text_color", default: "#000000", null: false
    t.integer "batch", null: false
    t.string "wikipedia", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch"], name: "index_bugs_on_batch"
    t.index ["hashid"], name: "index_bugs_on_hashid"
  end
end
