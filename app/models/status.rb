class Status < ActiveHash::Base
  self.data = [
    { id: 1, code: '---' },
    { id: 2, code: '新品・未使用' },
    { id: 3, code: '未使用に近い' },
    { id: 4, code: '目立った傷や汚れなし' },
    { id: 5, code: 'やや傷や汚れあり' },
    { id: 6, code: '傷や汚れあり' },
    { id: 7, code: '全体的に状態が悪い' },
  ]
end
