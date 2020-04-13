class Practice < ApplicationRecord
  belongs_to :user
  has_many :practice_groups
  has_many :groups
  scope :no_group, -> { where(group_id: nil) }

  def self.groups(user)
    where('practice = ? AND group_ids = ?', user)
  end
end
