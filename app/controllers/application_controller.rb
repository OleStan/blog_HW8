class ApplicationController < ActionController::Base
  before_action :count_visit
  private

  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end
  helper_method :current_author

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_author.nil?
  end

  def count_visit
    if current_author.nil?
      if cookies[:views].present?
        cookies[:views] = cookies[:views].to_i + 1
      else
        cookies[:views] = 1
      end
    else
      cookies[:views] = 0
    end
  end
end
