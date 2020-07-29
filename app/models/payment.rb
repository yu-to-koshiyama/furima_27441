class Payment < ActiveHash::Base
  self.data = [
    { id: 1, subject: '---' },
    { id: 2, subject: '着払い（購入者負担）' },
    { id: 3, subject: '送料込み（出品者負担)' }
  ]
end
