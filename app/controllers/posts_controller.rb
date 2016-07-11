class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def new
		@post = current_user.posts.build
	end

	def index
		@posts = Post.all
	end

	def show
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			flash[:success] = "Post sucessfully created"
			redirect_to root_path
		else 
			flash[:error] = @post.errors.full_messages
			render 'new'
		end
	end

	def edit
	end

	def destroy
		@post.delete
		flash[:danger] = "Are you sure you want to delete this post?"
		redirect_to root_path
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Post successfully updated"
			redirect_to root_path
		else
			render :edit
		end
	end

	private

	def post_params
		params.require(:post).permit(:description, :image)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
