class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  SKILLS_LIST = ["Théâtre de rue", "Arts du Cirque", "Peinture", "Sculpture", "Photographie", "Arts numériques", "Street art",
                "Graphisme", "Architecture", "Réalisation", "Direction artistique", "Rédaction",
                "Développement informatique", "Musique", "Danse", "Humour", "Littérature", "Composition", "Chant",
                "Production événementielle", "Scénographie", "Sérigraphie"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username, :first_name, :last_name, :competences
  validates :username, uniqueness: true
  before_save :clean_blank_competences
  has_many :projects, dependent: :destroy
  has_many :user_likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :blocks, dependent: :destroy
  has_many :collaborations

  def clean_blank_competences
    self.competences.delete("")
  end
end
