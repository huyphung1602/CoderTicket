class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to upcoming_path
    end
  end
end
