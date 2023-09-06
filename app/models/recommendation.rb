class Recommendation < ApplicationRecord
  belongs_to :giver, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :item
  has_many :list_recommendations, dependent: :destroy
  has_many :lists, through: :list_recommendations

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[comment],
                  associated_against: {
                    item: %i[title genre],
                    giver: %i[nickname]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
