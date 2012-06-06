class Ristourne < ActiveRecord::Base
  attr_accessible :ca_max, :ca_min, :valeur

  belongs_to :client
end
