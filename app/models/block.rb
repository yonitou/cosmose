class Block < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates_presence_of :content
end
