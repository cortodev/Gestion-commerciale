class Commande < ActiveRecord::Base
  belongs_to :client
  has_many :lignes, class_name: "Ligne_commande"
  attr_accessible :date_livraison
end
