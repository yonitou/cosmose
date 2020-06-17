class Block < ApplicationRecord
  belongs_to :user
  has_one_attached :upload
  # validates_presence_of :content
  # validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  # validates_attachment_content_type :audio, content_type: [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
end
