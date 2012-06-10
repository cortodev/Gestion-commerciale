class Adresse < ActiveRecord::Base
  attr_accessible :code_postal, :destinataire, :pays, :rue, :ville, :complement
  belongs_to :localisable, polymorphic: true

  validates_presence_of :destinataire, :rue, :ville

  def full_adresse
    "#{ destinataire } #{ rue } #{ ville } #{ pays unless pays.nil? || pays == "France" }"
  end
end
