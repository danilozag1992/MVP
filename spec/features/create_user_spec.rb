require 'rails_helper'

feature 'create my account' do
  scenario 'successfully' do
    visit(new_user_path)
    fill_in 'Username', with: 'danilo'
    click_on('Create my account')
    expect(page).to have_content('danilo')
  end
  scenario 'unsuccessfully' do
    visit(new_user_path)
    click_on('Create my account')
    expect(page).to have_content("If you already have account, please Login")
  end
end