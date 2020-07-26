FactoryBot.define do
  factory :user do
    nickname              { 'furimaくん' }
    email                 { 'sample@gmail.com' }
    password              { 'test0000' }
    password_confirmation { 'test0000' }
    family_name           { '山田' }
    first_name            { '陸太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birthday              { '1930-01-01' }
  end
end
