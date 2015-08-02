class PostsController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		#@post = Post.new(post_params)
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Your post has been created"
			redirect_to @post
		else
			flash[:error] = "Halt, you fiend! You need an image to post here!"
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
		if current_user != @post.user
			flash[:error] = "That post doesn't belong to you!"
			redirect_to root_path
		end
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		if @post.save
			flash[:success] = "Post updated hombre"
			redirect_to(post_path(@post))
		else
			flash[:error] = "Something is wrong with your form!"
			redirect_to(edit_post_path(@post))
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash["success"] = 'Problem solved!  Post deleted.'
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:caption, :image)
		end
end
