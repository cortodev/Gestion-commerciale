require "minitest_helper"

describe Utilisateur do
  before do
    @utilisateur = Utilisateur.new password: "password", password_confirmation: "password"
    @utilisateur_sans_agence = @utilisateur
    @utilisateur_sans_agence.nom = "nom"
    @utilisateur_sans_agence.email = "em@il.com"
  end

  it "won't validates if not attached to an agency" do
    @utilisateur_sans_agence.wont_be :valid?
  end
  it "validates if attached to an agence" do
    utilisateur_avec_agence = @utilisateur_sans_agence
    utilisateur_avec_agence.build_agence
    utilisateur_avec_agence.must_be :valid?
  end


  it "must provide basic information about himself" do
    utilisateur
  end
end
