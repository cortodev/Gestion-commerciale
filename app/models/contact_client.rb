class ContactClient < Utilisateur
  has_many :commandes
  belongs_to :commercial
  belongs_to :client
  has_many   :promotions, as: :promotionable
end
