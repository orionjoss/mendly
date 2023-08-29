class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.string :genre
      t.text :description
      t.string :author
      t.date :release_date
      t.integer :episode

      t.timestamps
    end
  end
end
