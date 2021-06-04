class User < ApplicationRecord

  has_many :user_projects
  has_many :projects , through: :user_projects

  def name_with_type
    "#{name} - [#{user_type}]"
  end
  
  has_many :user_bugs
  has_many :bugs ,through: :user_bugs
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
