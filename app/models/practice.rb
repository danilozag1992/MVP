class Practice < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :coach, class_name: 'User'
  has_many :practice_groups
  has_many :groups, -> { distinct }, through: :practice_groups, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }, case_sensitive: false, numericality: false
  validates_format_of :name, with: /^[a-z]+$/i, multiline: true
  validates :hours, presence: true, numericality: true
  scope :with_group, -> { joins(:practice_groups).distinct }
  scope :without_group, -> { includes(:practice_groups).where(practice_groups: {group_id: nil}) }
end
