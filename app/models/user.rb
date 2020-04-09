class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :username, presence: true, length: {minimum: 3, maximum: 20},
            uniqueness: true
end
