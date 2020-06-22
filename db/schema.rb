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

ActiveRecord::Schema.define(version: 2020_06_21_105056) do

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "商品", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "商品名"
    t.integer "price", default: 0, null: false, comment: "料金"
    t.text "content", comment: "商品詳細"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ユーザー", force: :cascade do |t|
    t.string "email", default: "", null: false, comment: "メールアドレス"
    t.string "encrypted_password", default: "", null: false, comment: "暗号化パスワード"
    t.string "reset_password_token", comment: "リセットパスワードトークン"
    t.datetime "reset_password_sent_at", comment: "リセットパスワード送信日時"
    t.datetime "remember_created_at", comment: "ログイン情報日時"
    t.string "name_sei", default: "", null: false, comment: "姓"
    t.string "name_mei", default: "", null: false, comment: "名"
    t.string "name_sei_kana", default: "", null: false, comment: "姓カナ"
    t.string "name_mei_kana", default: "", null: false, comment: "名カナ"
    t.string "phone_number", default: "", null: false, comment: "電話番号"
    t.string "prefecture", default: "", null: false, comment: "都道府県"
    t.string "city", default: "", null: false, comment: "市区町村"
    t.string "block", default: "", comment: "番地"
    t.string "building_name", default: "", comment: "建物名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
