class Commande < ActiveRecord::Base
  belongs_to :contact_client
  has_many :lignes, class_name: "LigneCommande"
  has_many :produits, through: :lignes
  attr_accessible :date_livraison
end
