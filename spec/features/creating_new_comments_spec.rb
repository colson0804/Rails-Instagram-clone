require 'rails_helper.rb'

feature 'Creating a new user' do  
  scenario 'can comment on an existing post' do
    user = create :user
    post = create(:post, user_id: user.id)
    sign_in_with user
    visit '/'
    find('.comment-field').set(';P')
    find('.comment-form').click_button 'submit'
    expect(page).to have_css("div.post-bottom", text: ';P')
  end
end  