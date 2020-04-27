require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  let(:user) { FactoryBot.create(:user, username: 'danilo') }
  scenario 'valid inputs' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log in'
    expect(page).to have_content('Logged in')
    visit new_group_path
    fill_in 'Name', with: 'Basketball'
    select 'Golf', from: 'group[icon]'
    click_on 'Create Group'
    expect(page).to have_content('Group created!')
  end

  scenario 'invalid inputs' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log in'
    expect(page).to have_content('Logged in')
    visit new_group_path
    click_on 'Create Group'
    expect(page).to have_content('Failed to create a group!')
  end
end
