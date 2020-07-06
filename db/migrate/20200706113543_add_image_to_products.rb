class AddImageToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image, :string, null: false, default: '', comment: '画像', after: :max_count
  end
end
