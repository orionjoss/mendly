class Recommendation < ApplicationRecord
  belongs_to :giver
  belongs_to :receiver
  belongs_to :item
end
