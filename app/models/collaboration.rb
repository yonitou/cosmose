class Collaboration < ApplicationRecord
  validates :request_content, presence: true
  belongs_to :project
  belongs_to :user
end
