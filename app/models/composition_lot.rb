class CompositionLot < ActiveRecord::Base
  attr_accessible :quantite

  belongs_to :lot
  belongs_to :produit
end
