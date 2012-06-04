class Lot < ActiveRecord::Base
  attr_accessible :ref_lot, :ref_produit, :quantite

  belongs_to :produit_lot, class_name: "Produit", foreign_key: :ref_lot, primary_key: :ref
  belongs_to :produit_dans_lot, class_name: "Produit", foreign_key: :ref_produit, primary_key: :ref
end
