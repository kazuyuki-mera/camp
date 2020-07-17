class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts, comment: 'お問い合わせ' do |t|
      t.string :name,      null: false, default: '', comment: 'お名前'
      t.string :name_kana, null: false, default: '', comment: 'お名前（カナ）'
      t.string :email,     null: false, default: '', comment: 'メールアドレス'
      t.text   :content,                             comment: '内容'
      t.timestamps
    end
  end
end
