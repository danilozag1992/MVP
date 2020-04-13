class Group < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :practice_groups
  has_many :practices, through: :practice_groups
end
