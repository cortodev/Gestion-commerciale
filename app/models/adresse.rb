class Adresse < ActiveRecord::Base
  attr_accessible :code_postal, :destinataire, :pays, :rue, :ville, :complement
end
