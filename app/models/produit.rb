class Produit < ActiveRecord::Base
  attr_accessible :nom, :puht, :tva, :quantite, :unite, :ref, :duree_conservation

  #permet de renvoyer les lots qui contiennent le produit
  has_many :lots_contenant, class_name: "Lot", foreign_key: :ref_produit, primary_key: :ref
  has_many :produits_contenant, through: :lots_contenant, source: :produit_lot, primary_key: :ref
  #permet de renvoyer les produits contenus dans le lot
  has_many :lots_contenu, class_name: "Lot", foreign_key: :ref_lot, primary_key: :ref
  has_many :produits_contenu, through: :lots_contenu, source: :produit_dans_lot, primary_key: :ref

  has_many :stocks
  has_many :agences, through: :stocks

  belongs_to :lieu_fabrication, class_name: "Adresse"

  has_many :ligne_commande
end
