class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "Post favorited."
      redirect_to [post.topic, post]
    else
      flash[:error] = "Favoriting failed."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Post unfavorited."
      redirect_to [post.topic, post]
    else
      flash[:error] = "Unfavoriting failed."
      redirect_to [post.topic, post]
    end
  end

end
