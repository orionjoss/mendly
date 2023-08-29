class ListRecommendation < ApplicationRecord
  belongs_to :recommendation
  belongs_to :list
end
