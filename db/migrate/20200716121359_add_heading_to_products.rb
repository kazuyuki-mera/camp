class AddHeadingToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :heading, :string, null: false, default: '', comment: '見出し', after: :name
  end
end
