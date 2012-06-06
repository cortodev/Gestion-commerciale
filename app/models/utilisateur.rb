class Utilisateur < ActiveRecord::Base
  attr_accessible :email, :nom, :prenom, :telephone, :roles_mask

  belongs_to :adresse
  has_one :adresse, as: :localisable
end
