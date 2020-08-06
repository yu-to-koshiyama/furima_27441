class Dealing < ApplicationRecord
  belongs_to :user
  belongs_to :exhibited_item
  belongs_to :purchase, optional: true
end
