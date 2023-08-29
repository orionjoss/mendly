class CreateListRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :list_recommendations do |t|
      t.references :recommendation, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
