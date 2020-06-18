class Chatroom < ApplicationRecord
   has_many :messages, dependent: :destroy
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
      chatroom.members.length == 2 && chatroom.members.include?(receiver) && chatroom.members.include?(sender) && chatroom.project.nil?
    end
   end


  def last_message
    self.messages.size > 1 ? self.messages.last.content : ''
  end


  def last_active
    delta = ((Time.now - self.messages.last.created_at) / 60).round
    if delta > 60
      delta = (delta/60).round
      if delta > 24
        delta = (delta/24).round.to_s + "j"
      else delta = delta.to_s + "h"
      end
    else delta = delta.to_s + "mn"
    end
    delta
  end

end
