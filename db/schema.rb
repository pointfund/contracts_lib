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

ActiveRecord::Schema.define(version: 2018_09_30_013132) do

  create_table "agencies", force: :cascade do |t|
    t.string "agt_busi_name"
    t.string "agt_num"
    t.string "agt_name"
    t.string "agt_addr"
    t.string "agt_city"
    t.string "agt_state"
    t.string "agt_zip"
    t.string "agt_email"
    t.string "agt_phone"
    t.string "agt_notes"
    t.string "agt_memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.integer "page_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string "name"
    t.integer "sections"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lenders", force: :cascade do |t|
    t.string "lend_name"
    t.string "lend_contact"
    t.string "lend_addr"
    t.string "lend_city"
    t.string "lend_state"
    t.string "lend_zip"
    t.string "lend_email"
    t.string "lend_phone"
    t.string "lend_notes"
    t.string "lend_memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bank_name"
    t.string "bank_routing"
    t.string "bank_account"
  end

  create_table "page_areas", force: :cascade do |t|
    t.integer "contract_id"
    t.integer "section_id"
    t.integer "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_layouts", force: :cascade do |t|
    t.string "name"
    t.integer "posx"
    t.integer "posy"
    t.integer "page_part"
    t.integer "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "page_area"
  end

  create_table "page_parts", force: :cascade do |t|
    t.string "name"
    t.integer "contract_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "page_area"
  end

  create_table "record_lists", force: :cascade do |t|
    t.integer "contract_id"
    t.string "var_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string "loan_name"
    t.date "current_date"
    t.string "client_first_name"
    t.string "client_last_name"
    t.string "client_nick"
    t.string "address_street"
    t.string "address_city"
    t.string "address_state"
    t.string "address_zip"
    t.date "note_date"
    t.integer "loan_amount"
    t.integer "fin_fee"
    t.string "repay_term1"
    t.string "repay_term2"
    t.date "repay_start"
    t.date "repay_1st"
    t.date "repay_mature"
    t.integer "total_amount"
    t.string "payment_mth_day"
    t.integer "loan_act_fee"
    t.decimal "stated_rate"
    t.integer "repay_penalty"
    t.decimal "daily_late_fee"
    t.integer "total_default"
    t.date "final_date"
    t.string "guarantee01"
    t.string "guarantee02"
    t.string "guarantee03"
    t.string "commencement_m"
    t.string "commencement_y"
    t.string "total_ded"
    t.date "r3001_date"
    t.string "agent_num"
    t.string "agent_email"
    t.string "agent_phone"
    t.integer "term_assignment_mths"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pay_pen"
    t.string "prepay_pen"
    t.integer "payment_type"
    t.integer "account_type"
    t.integer "assignment_type"
    t.integer "check_type"
    t.integer "business_type"
    t.integer "agt_id"
    t.integer "lend_id"
    t.string "loan_account_num"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "username"
    t.text "bio"
    t.string "title"
    t.string "useremail"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
