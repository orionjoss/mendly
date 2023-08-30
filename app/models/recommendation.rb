class Recommendation < ApplicationRecord
  belongs_to :giver, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :item
  has_many :list_recommendations, dependent: :destroy
  has_many :lists, through: :list_recommendations
  has_many :messages
end
