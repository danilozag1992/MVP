class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :practice_groups
  has_many :practices, -> { distinct }, through: :practice_groups, dependent: :destroy
  before_save { self.name = name.downcase }
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }, case_sensitive: false, numericality: false
  validates_format_of :name, with: /^[a-z]+$/i, multiline: true
end
