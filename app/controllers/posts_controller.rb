class PostsController < ApplicationController
  def index
    @posts = Post.where(main_post_id: nil).order("created_at DESC")
    @post = Post.new
  end

  def create
    if params[:main_post_id]
      main_post = Post.find(params[:main_post_id])

      post = main_post.comments.create(post: params[:post][:post], user: current_user)
    else
      post = current_user.posts.create(post: params[:post][:post], picture: params[:post][:picture])
    end

    redirect_to root_path
  end
end
