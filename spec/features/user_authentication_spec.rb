require 'rails_helper'

feature 'User authentication' do  
  background do
    user = create(:user)
  end

  scenario 'can log in from the index via dynamic navbar' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Password', with: 'foobar123'
    click_button('Log In')

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end
end  