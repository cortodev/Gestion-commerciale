class Client < ActiveRecord::Base
  attr_accessible :categorie_juridique, :commentaires, :naf_2003, :naf_2008, :raison_sociale, :siren, :site_web

  belongs_to :adresse
  has_many   :contact_clients
  has_many   :commandes, through: :contact_clients
  has_many   :promotions, as: :promotionable
  has_many   :ristournes
end
