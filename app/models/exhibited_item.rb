class ExhibitedItem < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :payment
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :until_delivery

  #空の投稿を保存できないようにする
  validates :name, :explanation, :category_id, :status_id, :payment_id, :prefecture_id, :until_delivery_id,:price, presence: true
  # priceの範囲を制限
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  #選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :payment_id, :prefecture_id, :until_delivery_id
  end
end
