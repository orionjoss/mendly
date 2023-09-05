class AddGptResponseToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :gpt_response, :text
  end
end
