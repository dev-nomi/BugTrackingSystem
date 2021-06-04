class Project < ApplicationRecord 
  
  has_many :user_projects
  has_many :users,through: :user_projects


  has_many :bugs, dependent: :destroy


  validates :name,presence: true
  validates :description,presence: true

end