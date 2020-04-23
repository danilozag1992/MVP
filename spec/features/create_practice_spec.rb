require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  let(:user) { FactoryBot.create(:user, username: 'danilo') }
  scenario 'valid inputs' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log in'
    expect(page).to have_content('Logged in')
    visit new_practice_path
    fill_in 'Name', with: 'basket'
    fill_in 'Hours', with: 3
    click_on 'Create Practice'
    expect(page).to have_content('Practice Created')
  end

  scenario 'invalid inputs' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log in'
    expect(page).to have_content('Logged in')
    visit new_practice_path
    click_on 'Create Practice'
    expect(page).to have_content('Not Created!')
  end
end