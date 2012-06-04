class Stock < ActiveRecord::Base
  attr_accessible :quantite_disponible, :unite, :date_fabrication, :date_peremption

  has_many :agences
  has_many :produits
end
