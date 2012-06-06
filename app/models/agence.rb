class Agence < ActiveRecord::Base
  attr_accessible :nom

  has_many :stocks
  has_many :produits, through: :stocks

  has_one :adresse, as: :localisable
end
