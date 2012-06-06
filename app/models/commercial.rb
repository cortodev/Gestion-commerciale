class Commercial < Utilisateur
  has_many :contact_clients
  has_many :clients, through: :contact_clients
end
