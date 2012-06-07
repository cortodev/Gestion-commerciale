class Utilisateur < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :nom, :prenom, :telephone, :roles_mask, :position

  belongs_to :adresse
  has_one :adresse, as: :localisable
end
