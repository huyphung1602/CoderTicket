class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to upcoming_path
    end

    if params[:is_guest]
      redirect_to upcoming_path
    end
  end
end
