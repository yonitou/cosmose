class Project < ApplicationRecord
  CATEGORIES_LIST = ["Musique", "Street Art", "Architecture", "Arts Vivants / Arts de la scène", "Arts Numériques",
                     "Littérature", "Cinéma", "Arts Visuels", "Scuplture", "Arts Médiatiques", "Bandes Dessinées", "Jeux Vidéo & Multimédia"]
  validates :title, :description, :categories, :address, presence: true
  belongs_to :user
  has_many :user_likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  before_save :clean_blank_categories
  has_many :collaborations, dependent: :destroy

  def clean_blank_categories
    categories.delete("")
  end
end
