class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :lists
  has_many :given_recommendations, class_name: "Recommendation", foreign_key: "giver_id"
  has_many :received_recommendations, class_name: "Recommendation", foreign_key: "receiver_id"
end
