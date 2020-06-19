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
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  def competences_not_empty
    competences.delete("")
    errors.add(:competences, 'ne peut pas être vide') if competences.length.zero?
  end

  def collaborator?(project)
    Collaboration.find_by(project: project, user: self, status: true)
  end

  def all_projects
    all_projects = []
    self.projects.each {|project| all_projects << project}
    self.collaborations.each {|collaboration| all_projects << collaboration.project if collaboration.status == true}
    return all_projects
  end

  def owner?(project)
    project.user == self
  end

  def visitor?(project)
    !owner?(project) && !collaborator?(project)
  end

  def chatrooms
    user_chatrooms = self.projects.to_a.map { |project| project.chatroom }
    self.collaborations.each do |collaboration|
      user_chatrooms << collaboration.project.chatroom if collaboration.status == true
    end
    user_messages = Message.where(user: self).to_a
    user_messages << Message.where(recipient_id: self)
    user_messages_chatrooms = user_messages.flatten.map { |message| message.chatroom }
    result = user_chatrooms + user_messages_chatrooms
    result.uniq.reject { |element| element.nil? }
  end
end
