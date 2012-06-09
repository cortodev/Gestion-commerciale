class UtilisateursController < ApplicationController
  def new
    @utilisateur = Utilisateur.new
  end

  def create
    @utilisateur = Utilisateur.create params[:utilisateur]
    if @utilisateur.save
      redirect_to root_url, notice: "Utilisateur cree !"
    else
      render "new"
    end
  end
end
