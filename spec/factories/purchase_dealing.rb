FactoryBot.define do
  factory :purchase_dealing do
    postal_code         { '000-0000' }
    prefecture_id       { '2' }
    city                { '東京' }
    house_number        { '中央' }
    building            { '' }
    phone_number        { '09012345678' }
    exhibited_item_id   { '2' }
    user_id             { '3 ' }
    token               { 'tok_abcc8bfad5d2cc85b6bc0081d76a' }
  end
end
