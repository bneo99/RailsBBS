class HomeController < ApplicationController
  def index
    @posts = Post.order(:id).reverse()
  end
end
