class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  SKILLS_LIST = ["Théâtre de rue", "Arts du Cirque", "Peinture", "Sculpture", "Photographie", "Arts numériques", "Street art",
                 "Graphisme", "Architecture", "Réalisation", "Direction artistique", "Rédaction",
                 "Développement informatique", "Musique", "Danse", "Humour", "Littérature", "Composition", "Chant",
                 "Production événementielle", "Scénographie", "Sérigraphie"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username, :first_name, :last_name

  validates :username, uniqueness: true
  validate :competences_not_empty
  has_many :projects, dependent: :destroy
  has_many :user_likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :blocks, dependent: :destroy
  has_many :collaborations

  def competences_not_empty
    competences.delete("")
    errors.add(:competences, 'ne peut pas être vide') if competences.length.zero?
  end

  def collaborator?(project)
    Collaboration.find_by(project: project, user: self, status: true)
  end

  def owner?(project)
    project.user == self
  end

  def visitor?(project)
    !owner?(project) && !collaborator?(project)
  end
end
