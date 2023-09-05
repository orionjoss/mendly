class ModifyChatroomForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :messages, column: :chatroom_id
    add_foreign_key :messages, :chatrooms, on_delete: :cascade
  end
end
