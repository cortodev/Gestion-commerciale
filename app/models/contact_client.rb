class ContactClient < ActiveRecord::Base
  acts_as :utilisateur
  #belongs_to :utilisateur

  self.primary_key = :utilisateur_id
  has_many :commandes
  belongs_to :commercial
  belongs_to :client
  has_many   :promotions, as: :promotionable

  #def test
    #p utilisateur
    #p send :utilisateur
  #end

  #def initialize
    #super
    #test
  #end
end
