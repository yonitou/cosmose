class Chatroom < ApplicationRecord
   has_many :messages
   belongs_to :project, optional: true

   def members
    members = []
    self.messages.each do |message|
      members << message.user
      members << message.recipient if message.recipient
    end
    members = members.uniq
   end

   def self.exists_for_users?(receiver, sender)
    self.all.find do |chatroom|
      chatroom.members.length == 2 && chatroom.members.include?(receiver) && chatroom.members.include?(sender)
    end
   end
end
