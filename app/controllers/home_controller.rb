class HomeController < ApplicationController
  def index
    @posts = Post.order(:updated_at).reverse_order.page(params[:page])

    #get a map of user id:name
    @users = Hash.new
    User.all.each do |user|
      @users[user.id] = user.fname + " " + user.lname
    end
  end
end
