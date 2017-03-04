class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :is_event_owner?, :event_edit_permission?

  def current_user 
    return @current_user if @current_user

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def signed_in?
    current_user
  end

  def is_event_owner?
    @event = Event.find(Event.find(params[:id]))

    if @event.owner == current_user
      true
    else
      false
    end
  end

  def event_edit_permission?
    if !is_event_owner?
      flash[:notice] = "You must be the event owner to see this page"
      redirect_to root_path
    end
  end
end
