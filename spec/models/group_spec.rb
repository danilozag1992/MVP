require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { should belong_to(:creator) }
    it { should have_many(:practices) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
