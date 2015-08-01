require 'rails_helper.rb'

feature 'editing posts' do  
  background do
    post = create :post
    user = create :user

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'can edit a post' do
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end
  scenario "a post won't update without an attached image" do
    attach_file('Image', 'spec/files/coffee.txt')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end
end  