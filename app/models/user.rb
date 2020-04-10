class User < ApplicationRecord
  has_one_attached :image
  before_save { self.username = username.downcase }
  validates :username, presence: true, length: {minimum: 3, maximum: 20},
            uniqueness: true
end
