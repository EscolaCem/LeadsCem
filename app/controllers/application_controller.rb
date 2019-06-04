class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  
protected
def after_sign_in_path_for(resource)
  if current_user.email == "italo.volotao@escolacem.com.br" || current_user.superadmin?
  dashboard_index_path
  else
  root_path
  end
end 
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

   private

   def user_not_authorized
      if current_user.present?
      flash[:notice] = "Você não tem permissão"
      redirect_to(request.referrer || root_path)
    else
      redirect_to(request.referrer || root_path)
    end
  end
end
