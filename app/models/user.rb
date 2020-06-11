class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  SKILLS_LIST = ["Théâtre de rue", "Circacien / Circacienne", "Peintre", "Sculpteur / Sculptrice", "Photographe", "Artiste numérique", "Street artiste",
                "Graphiste", "Architecte", "Réalisateur / Réalisatrice", "Directeur / Directrice artistique", "Rédacteur / Rédactrice",
                "Développeur / Développeuse", "Musicien / Musicienne", "Danseur / Danseuse", "Humoriste", "Auteur", "Compositeur / Compositrice", "Chanteur / Chanteuse",
                "Producteur / Productrice", "Scénographe", "Sérigraphiste", "Comédien / Comédienne"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username, :first_name, :last_name, :competences
  validates :username, uniqueness: true
  before_save :clean_blank_competences
  has_many :projects, dependent: :destroy
  has_many :user_likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :blocks, dependent: :destroy

  def clean_blank_competences
    self.competences.delete("")
  end
end
