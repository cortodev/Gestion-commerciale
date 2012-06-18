class Produit < ActiveRecord::Base
  attr_accessible :nom, :puht, :tva, :quantite, :unite, :ref, :duree_conservation

  #permet de renvoyer les lots qui contiennent le produit
  has_many :lots_contenant, class_name: "Lot", foreign_key: :ref_produit, primary_key: :ref
  has_many :produits_contenant, through: :lots_contenant, source: :produit_lot, primary_key: :ref
  #permet de renvoyer les produits contenus dans le lot
  has_many :lots_contenu, class_name: "Lot", foreign_key: :ref_lot, primary_key: :ref
  has_many :produits_contenu, through: :lots_contenu, source: :produit_dans_lot, primary_key: :ref

  has_many :stocks
  has_many :agences, through: :stocks

  has_one :adresse, as: :localisable

  has_many :ligne_commandes

  has_many :promotions
  has_many :ristournes

  validates_uniqueness_of :ref, :nom, message: "Ce produit existe deja"
  validates_presence_of :ref, :nom, :tva, :puht, :quantite, :unite, :duree_conservation, message: "Doit etre renseigne"
  validates_inclusion_of :tva, in: [5.5, 19.7]
  validates_inclusion_of :unite, in: %w(gr L pieces)
  validates_numericality_of :quantite, :duree_conservation, :puht, greater_than_or_egal_to: 0, message: "Doit etre positif"

  before_validation :set_default_tva, :set_default_unite

  private

  def set_default_tva
    tva = 19.7 if tva.nil?
  end

  def set_default_unite
    unite = "pieces" if unite.nil?
  end
end
