class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.driver?
      pages_pending_services_path
    else
       if resource.is_a?(User) && resource.user?
          new_service_path
        else 
           super
       end
    end
  end
  
end
