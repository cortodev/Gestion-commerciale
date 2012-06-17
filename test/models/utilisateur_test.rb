require "minitest_helper"

describe Utilisateur do
  it "must be attached to an agency" do
    utilisateur_sans_agence = Utilisateur.new nom: "nom", email: "em@il.com", password: "password", password_confirmation: "password"
    utilisateur_sans_agence.wont_be :valid?
  end
end
