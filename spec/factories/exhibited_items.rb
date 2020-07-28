FactoryBot.define do
  factory :exhibited_item do
    id                  { '1' }
    name                { '商品' }
    explanation         { Faker::Lorem.sentence }
    price               { '300' }
    category_id         { '2' }
    status_id           { '2' }
    payment_id          { '2' }
    prefecture_id       { '2' }
    until_delivery_id   { '2' }
    user_id             { '1' }

    after(:build) do |dummy|
      dummy.image =  fixture_file_upload(Rails.root.join('spec', 'fixtures', 'test_image.jpg'), 'image/jpg')
    end
    # trait :image do
    #   image { fixture_file_upload Rails.root.join('spec', 'fixtures', 'test_image.jpg'), 'image/jpg' }
    # end
  end
end
