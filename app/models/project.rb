class Project < ApplicationRecord

  # include PgSearch::Model
  # pg_search_scope :search_by_categories,
  #   against: :categories,
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }

  CATEGORIES_LIST = ["Musique", "Street Art", "Architecture", "Arts Vivants / Arts de la scène", "Arts Numériques",
                     "Littérature", "Cinéma", "Arts Visuels", "Scuplture", "Arts Médiatiques", "Bandes Dessinées", "Jeux Vidéo & Multimédia"]
  validates :title, :description, :categories, :address, presence: true
  belongs_to :user
  has_many :blocks
  has_many :user_likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  before_save :clean_blank_categories
  has_many :collaborations, dependent: :destroy
  geocoded_by :address
  has_one :chatroom, dependent: :destroy
  after_create :init_chatroom

  after_validation :geocode, if: :will_save_change_to_address?

  def clean_blank_categories
    categories.delete("")
  end

  def collabs
    @collabs = self.collaborations.where(status: true)
  end

  def init_chatroom
    chatroom = Chatroom.create(name: self.title, project: self)
    Message.create(content: "Bienvenue dans la discussion du projet #{self.title}", user: self.user, chatroom: chatroom )
  end
end
