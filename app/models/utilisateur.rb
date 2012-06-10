class Utilisateur < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :nom, :prenom, :telephone, :roles_mask, :position, :password, :password_confirmation

  has_many :adresses, as: :localisable

  validates_presence_of :nom

  def full_name
    "#{ nom } #{ prenom unless prenom.nil? }"
  end
end
