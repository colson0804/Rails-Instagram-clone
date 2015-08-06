require 'rails_helper.rb'

feature 'Deleting comments' do  
  background do
    user_one = create(:user)
    user_two = create(:user, id: 2, user_name: "user2", email: "user2@gmail.com")
    post = create(:post, user_id: 1)
    comment = create(:comment, user_id: 2, post_id: post.id, id: 1)
    comment_two = create(:comment, user_id: 1, post_id: post.id, id: 2, content: "YourString")
    sign_in_with user_two
  end
  scenario 'can delete a comment' do
    visit '/'
    expect(page).to have_content('MyString')
    click_link("delete-1")
    expect(page).to_not have_content('MyString')
  end

  scenario 'user can\'t delete another\'s comments' do
    visit '/'
    expect(page).to have_content('YourString')
    expect(page).to_not have_link("delete-2")
  end

  scenario 'user cannot delete a comment not belonging to them via urls' do
    visit '/'
    expect(page).to have_content('YourString')
    page.driver.submit :delete, "posts/1/comments/2", {}
    expect(page).to have_content("That doesn't belong to you!")
    expect(page).to have_content('YourString')
  end
end 