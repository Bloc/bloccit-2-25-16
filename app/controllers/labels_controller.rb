class LabelsController < ApplicationController
  def show
    @label = Label.find(params[:id])
    @context = @label.labelable_type
  end
end
