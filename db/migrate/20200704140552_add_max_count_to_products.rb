class AddMaxCountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :max_count, :integer, null: false, default: 0, comment: '最大人数', after: :content
  end
end
