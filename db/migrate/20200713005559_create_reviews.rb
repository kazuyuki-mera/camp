class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews, comment: 'レビュー' do |t|
      t.references :product, foreign_key: true,       comment: '商品ID'
      t.references :user,    foreign_key: true,       comment: 'ユーザーID'
      t.integer    :rate,    null: false, default: 0, comment: '評価'
      t.text       :content,                          comment: '内容'
      t.timestamps
    end
  end
end
