class Stock < ActiveRecord::Base
  attr_accessible :quantite_disponible, :unite, :date_fabrication, :date_peremption

  belongs_to :agence
  belongs_to :produit
end
