require 'rails_helper.rb'

feature 'Can see a list of posts on the index' do  
  background do
    post_one = create(:post, caption: "This is post one")
    post_two = create(:post, caption: "This is the second post")
    user = create :user

    sign_in_with(user)
  end
  scenario 'the index lists all posts' do
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='coffee']")
  end
end  