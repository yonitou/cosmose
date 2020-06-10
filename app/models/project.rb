class Project < ApplicationRecord

  CATEGORIES_LIST = ["Musique", "Street Art", "Architecture", "Arts Vivants / Arts de la scène", "Arts Numériques",
  "Littérature", "Cinéma", "Arts Visuels", "Scuplture", "Arts Médiatiques", "Bandes Dessinées", "Jeux Vidéo & Multimédia" ]
  validates :title, :description, :category, :address, :open_to_collab, :finished, presence: true
  belongs_to :user

  before_save :clean_blank_categories

  def clean_blank_categories
    self.categories.delete("")
  end
end
