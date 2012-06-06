class ContactClient < Utilisateur
  has_many :commandes
  belongs_to :commercial
  belongs_to :client
end
