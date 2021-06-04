class Bug < ApplicationRecord
  has_one_attached :screenshot
  belongs_to :project

  has_many :user_bugs
  has_many :users,through: :user_bugs



  validates :title,presence: true
  validates :status,presence: true

  validates_uniqueness_of :title
end