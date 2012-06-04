class LigneCommande < ActiveRecord::Base
  belongs_to :commande
  belongs_to :produit
  attr_accessible :quantite
end
