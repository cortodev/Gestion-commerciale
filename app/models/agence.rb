class Agence < ActiveRecord::Base
  belongs_to :adresse
  attr_accessible :nom
end
