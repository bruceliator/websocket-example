class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :authors, through: :messages
  validates :topic, presence: true, uniqueness: true, case_sensitive: false
end
