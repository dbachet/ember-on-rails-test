class Api::V1::PostsController < ApplicationController
  respond_to :json

  def index
    respond_with Post.all
  end

  def show
    respond_with Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      render json: @post
    end
  end
end