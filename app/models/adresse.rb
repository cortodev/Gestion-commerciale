class Adresse < ActiveRecord::Base
  attr_accessible :code_postal, :destinataire, :pays, :rue, :ville, :complement
  belongs_to :localisable, polymorphic: true
end
