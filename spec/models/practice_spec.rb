require 'rails_helper'

RSpec.describe Practice, type: :model do
  describe 'associations' do
    it { should belong_to(:coach).class_name('User') }
    it { should have_many(:groups) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:hours) }
  end
end