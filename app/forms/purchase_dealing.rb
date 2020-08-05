class PurchaseDealing
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :exhibited_item_id, :user_id, :token

  validates :prefecture_id, :city, :house_number, :token, presence: true
  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  POHNE_NUMBER_REGEX = /\A\d{11}\z/
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }
    validates :phone_number, format: { with: POHNE_NUMBER_REGEX }
  end

  # 選択が「---」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    # 購入の情報を保存し、「purchase」という変数に入れている
    purchase = Purchase.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, exhibited_item_id: exhibited_item_id)
    # 住所の情報を保存
    Dealing.create!(user_id: user_id, exhibited_item_id: exhibited_item_id)
  end
end
