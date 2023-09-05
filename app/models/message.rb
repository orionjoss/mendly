class Message < ApplicationRecord
  belongs_to :recommendation
  belongs_to :user
  belongs_to :chatroom
end
