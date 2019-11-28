class PostsController < ApplicationController
  def index
    @posts = Post.where("user_id = ?", current_user.id).reverse_order.page(params[:page])
  end

  def all
    #redirect to root if not logged in / not admin
    redirect_to root_path, warning: "You are not authorized" unless !current_user.nil? and current_user.admin?

    #order the list by latest updated date first
    @posts = Post.order(:updated_at).reverse_order.page(params[:page])

    #get a map of user id:email
    @users = Hash.new
    User.all.each do |user|
      @users[user.id] = user.email
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    post = Post.create!(post_params)
    post.update_attribute :user_id, current_user.id
  if post.save
      redirect_to post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
 
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    if current_user.admin?
      redirect_to posts_all_path
    else
      redirect_to posts_path
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
