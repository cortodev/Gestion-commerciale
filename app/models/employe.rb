class Employe < ActiveRecord::Base
  acts_as :utilisateur
  belongs_to :agence
  attr_accessible :date_embauche, :salaire, :type, :type_contrat
end
