class SessionsController < ApplicationController
  def new
    @utilisateur = Utilisateur.new
  end

  def create
    utilisateur = Utilisateur.find_by_email(params[:email])
    if utilisateur && utilisateur.authenticate(params[:password])
      session[:utilisateur_id] = utilisateur.id
      redirect_to root_url, notice: "Merci de vous etre connecte #{utilisateur.nom_complet}."
    else
      flash.now.alert ="Mauvaise combinaison emai/mot de passe. Veuillez reessayer."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Vous etes deconnecte. A plus tard."
  end
end
