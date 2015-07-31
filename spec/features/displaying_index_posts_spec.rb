require 'rails_helper.rb'

feature 'display index posts' do
	scenario 'should view images' do
		# Create multiple posts using factories.
		post1 = create(:post, caption: "This is post 1")
		post2 = create(:post, caption: "This is post 2")
		# User visits the root route.
		visit '/'
		# User can see the comments and images of the posts we’ve created.
		expect(page).to have_content("This is post 1")
		expect(page).to have_content("This is post 2")
		expect(page).to have_css("img[src*='coffee.jpg']")
	end
end