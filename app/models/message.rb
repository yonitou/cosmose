class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id, optional: true
  validates_presence_of :content
end
