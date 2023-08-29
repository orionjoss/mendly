class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.references :giver, null: false, foreign_key: { to_table: 'users' }
      t.references :receiver, null: false, foreign_key: { to_table: 'users' }
      t.references :item, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
