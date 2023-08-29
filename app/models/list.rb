class List < ApplicationRecord
  belongs_to :user
  has_many :list_recommendations
  has_many :recommendations, through: :list_recommendations
end
