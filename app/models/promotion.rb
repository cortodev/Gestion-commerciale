class Promotion < ActiveRecord::Base
  attr_accessible :unite, :valeur

  belongs_to :promotionable, polymorphic: true
  belongs_to :produit
end
