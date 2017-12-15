class PostsController < ApplicationController
  before_action :require_user, only: [:index, :show]
  before_action :require_edit, only: [:edit, :update, :disable]
  before_action :require_delete, only: [:destroy]

  def index
  	@posts = Post.where(status: true)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  	@post.status = true
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to root_path, notice: "Add new post complete!"
  	else
  		render 'new'
  	end
  end

  def edit
  	@post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(post_params)
  		redirect_to root_path, notice: "Update post #{@post.name} complete!"
  	else
  		redirect_to root_path, notice: "Update post #{@post.name} failed!"
  	end
  end

  def disable
  	@post = Post.find(params[:id])
  	@post.status = false
  	if @post.save
  		redirect_to root_path, notice: "Disable post #{@post.name} complete!"
  	else
  		redirect_to root_path, notice: "Disable post #{@post.name} failed!"
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to root_path, notice: "Delete post #{@post.name} complete!"
  end

  def post_params
  	params.require(:post).permit(:name, :image, :content, :status, :user_id)
  end
end
