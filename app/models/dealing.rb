class Dealing < ApplicationRecord
  belongs_to :user
  belongs_to :exhibited_item
end
