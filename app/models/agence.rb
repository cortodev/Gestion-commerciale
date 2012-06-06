class Agence < ActiveRecord::Base
  attr_accessible :nom

  belongs_to :adresse

  has_many :stocks
  has_many :produits, through: :stocks
end
