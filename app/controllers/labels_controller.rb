class LabelsController < ApplicationController
  def new
    @context = context
    @label = @context.labels.new
  end

  def create
    @context = context
    @label = @context.labels.new(label_params)

    if @label.save
      redirect_to context_url(context)
    end
  end

  def show
    @label = Label.find(params[:id])
    @context = @label.labelable_type
  end

  private
  def label_params
    params.require(:label).permit!
  end

  def context
    if params[:topic_id]
      id = params[:topic_id]
      Topic.find(params[:topic_id])
    else
      id = params[:post_id]
      Post.find(params[:post_id])
    end
  end

  def context_url(context)
    if Topic === context
      topic_path(context)
    else
      post_path(context)
    end
  end

end
