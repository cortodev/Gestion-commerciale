class LigneCommande < ActiveRecord::Base
  attr_accessible :quantite

  belongs_to :commande
  belongs_to :produit
end
