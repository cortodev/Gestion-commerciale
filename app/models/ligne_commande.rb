class LigneCommande < ActiveRecord::Base
  attr_accessible :quantite

  belongs_to :commande
  belongs_to :produit

  def prix_ht
    produit.puht * quantite
  end

  def taxes
    produit.puht * produit.tva / 100
  end

  def prix_ttc
    prix_ht + taxes
  end
end
