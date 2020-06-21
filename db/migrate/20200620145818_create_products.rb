class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, comment: '商品' do |t|
      t.string  :name,  null: false, default: '', comment: '商品名'
      t.integer :price, null: false, default: 0,  comment: '料金'
      t.text    :content,                         comment: '商品詳細'
      t.timestamps
    end
  end
end
