class User < ApplicationRecord
  before_save { self.username = username.downcase }
  has_one_attached :image
  has_many :groups, dependent: :destroy
  has_many :practices, foreign_key: :coach_id, dependent: :destroy
  validates :username, presence: true, length: {minimum: 3, maximum: 20},
            uniqueness: true
end
