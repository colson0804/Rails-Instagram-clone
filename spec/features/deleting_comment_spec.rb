require 'rails_helper.rb'

feature 'Deleting comments' do  
  background do
    user_one = create(:user)
    user_two = create(:user, id: 2, user_name: "user2", email: "user2@gmail.com")
    post = create(:post, user_id: 1)
    comment = create(:comment, user_id: 2, post_id: post.id)
    sign_in_with user_two
  end
  scenario 'can delete a comment' do
    visit '/'
    expect(page).to have_content('MyString')
    click_link("delete-1")
    expect(page).to have_content('Comment deleted :(')
  end
end 