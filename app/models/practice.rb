class Practice < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :coach, class_name: 'User'
  has_many :practice_groups
  has_many :groups, -> { distinct }, through: :practice_groups, dependent: :destroy
  validates :name, presence: true
  validates :hours, presence: true

  scope :with_group, -> { joins(:practice_groups).distinct }
  scope :without_group, -> { includes(:practice_groups).where(practice_groups: { group_id: nil }) }
end
