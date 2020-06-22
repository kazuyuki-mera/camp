# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, comment: 'ユーザー' do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "", comment: 'メールアドレス'
      t.string :encrypted_password, null: false, default: "", comment: '暗号化パスワード'

      ## Recoverable
      t.string   :reset_password_token,   comment: 'リセットパスワードトークン'
      t.datetime :reset_password_sent_at, comment: 'リセットパスワード送信日時'

      ## Rememberable
      t.datetime :remember_created_at, comment: 'ログイン情報日時'

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # ユーザー追加情報
      t.string :name_sei,      null: false, default: '', comment: '姓'
      t.string :name_mei,      null: false, default: '', comment: '名'
      t.string :name_sei_kana, null: false, default: '', comment: '姓カナ'
      t.string :name_mei_kana, null: false, default: '', comment: '名カナ'
      t.string :phone_number,  null: false, default: '', comment: '電話番号'
      t.string :prefecture,    null: false, default: '', comment: '都道府県'
      t.string :city,          null: false, default: '', comment: '市区町村'
      t.string :block,                      default: '', comment: '番地'
      t.string :building_name,              default: '', comment: '建物名'

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
