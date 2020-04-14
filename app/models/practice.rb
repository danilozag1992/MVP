class Practice < ApplicationRecord
  belongs_to :coach, class_name: 'User'
  has_many :practice_groups
  has_many :groups, -> { distinct }, through: :practice_groups
  default_scope { order(created_at: :desc) }
  scope :no_group, -> { where(group_id: nil) }

  def self.groups(user)
    where('practice = ? AND group_ids = ?', user)
  end
  validates :name, presence: true
  validates :hours, presence: true
end
