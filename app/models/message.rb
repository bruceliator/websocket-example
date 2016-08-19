class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :author, class_name: User, foreign_key: :user_id

  delegate :username, to: :author, allow_nil: true
end
