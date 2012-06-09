class ApplicationController < ActionController::Base
  protect_from_forgery

private
  def utilisateur_connecte
    @utilisateur_connecte ||= Utilisateur.find session[:utilisateur_id] if session[:utilisateur_id]
  end
  helper_method :utilisateur_connecte
end
