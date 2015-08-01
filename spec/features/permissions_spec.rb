require 'rails_helper'

feature 'Permissions' do  
  scenario 'cannot view index posts without logging in' do  
    visit '/'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario ' cannot create a new post without logging in' do  
    visit new_post_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end  
end  