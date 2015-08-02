class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_post_params, only: [:show, :edit, :update, :destroy]
	before_action :owned_post, only: [:edit, :update, :destroy]

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
	end

	def edit
	end

	def update
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
		@post.destroy
		flash["success"] = 'Problem solved!  Post deleted.'
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:caption, :image)
		end

		def get_post_params
			@post = Post.find(params[:id])
		end

		def owned_post
		  unless @post.user.id == current_user.id
		    flash[:alert] = "That post doesn't belong to you!"
		    redirect_to root_path
		  end
		end
end
