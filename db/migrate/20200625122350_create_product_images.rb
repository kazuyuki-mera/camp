class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images, comment: '商品イメージ' do |t|
      t.references :product, foreign_key: true, comment: '商品ID'
      t.string     :path,    null: false,      comment: 'パス'
      t.timestamps
    end
  end
end
