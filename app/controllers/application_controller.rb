class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def update_labels(labels)
    new_labels = []
    if labels != nil && labels.size > 0
      labels.split(",").each do |label|
        stripped_label = label.strip
        l = Label.new(name: stripped_label)
        new_labels << l
      end
    end
    new_labels
  end

  private
  def require_sign_in
    unless current_user
      flash[:error] = "You must be logged in to do that"
      redirect_to new_session_path
    end
  end
end
