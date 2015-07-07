class PostsController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @post.topic = @topic

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end
end
