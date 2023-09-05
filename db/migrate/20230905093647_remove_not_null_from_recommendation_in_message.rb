class RemoveNotNullFromRecommendationInMessage < ActiveRecord::Migration[7.0]
  def change
    change_column_null :messages, :recommendation_id, true
  end
end
