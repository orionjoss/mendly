class Item < ApplicationRecord
  belongs_to :category
  has_many :recommendations, dependent: :destroy
end
