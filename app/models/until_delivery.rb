class UntilDelivery < ActiveHash::Base
  self.data = [
    { id: 1, time: '---' },
    { id: 2, time: '1~2日で発送' },
    { id: 3, time: '2~3日で発送' },
    { id: 4, time: '4~7日で発送' }
  ]
end
