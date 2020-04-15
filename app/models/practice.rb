class Practice < ApplicationRecord
  belongs_to :coach, class_name: 'User'
  has_many :practice_groups
  has_many :groups, through: :practice_groups
  default_scope { order(created_at: :desc) }
  scope :with_group, -> { joins(:practice_groups).distinct }
  scope :without_group, -> { includes(:practice_groups).where(practice_groups: { group_id: nil }) }

  def self.groups(user)
    where('practice = ? AND group_ids = ?', user)
  end
  validates :name, presence: true
  validates :hours, presence: true
end
