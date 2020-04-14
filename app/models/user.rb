class User < ApplicationRecord
  has_one_attached :image
  has_many :groups, dependent: :destroy
  has_many :practices, foreign_key: :coach_id, dependent: :destroy
  before_save { self.username = username.downcase }
  validates :username, presence: true, length: {minimum: 3, maximum: 20},
            uniqueness: true
end
