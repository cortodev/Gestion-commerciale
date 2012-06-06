class Utilisateur < ActiveRecord::Base
  attr_accessible :email, :nom, :prenom, :telephone

  belongs_to :adresse
end
