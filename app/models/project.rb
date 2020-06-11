class Project < ApplicationRecord

  CATEGORIES_LIST = ["Musique", "Street Art", "Architecture", "Arts Vivants / Arts de la scène", "Arts Numériques",
  "Littérature", "Cinéma", "Arts Visuels", "Scuplture", "Arts Médiatiques", "Bandes Dessinées", "Jeux Vidéo & Multimédia" ]
  validates :title, :description, :categories, :address, presence: true
  belongs_to :user
  has_many :user_likes
  before_save :clean_blank_categories

  def clean_blank_categories
    self.categories.delete("")
  end
end
