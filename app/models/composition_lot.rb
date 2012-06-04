class CompositionLot
  attr_accessible :quantite

  belongs_to :lot
  belongs_to :produit
end
