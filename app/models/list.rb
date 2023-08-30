class List < ApplicationRecord
  belongs_to :user
  has_many :list_recommendations, dependent: :destroy
  has_many :recommendations, through: :list_recommendations
end
