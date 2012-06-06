Adresse.create [
  { destinataire: "Societe Canard Dodu", rue: "rue du Canard", ville: "Paris", code_postal: 75000 },
  { destinataire: "Agence Canard Dodu", rue: "rue Dodu", ville: "Lyon", code_postal: 69000 },
  { destinataire: "Usine Canard Dodu", rue: "rue des Conserves", complement: "Z.A. du Buisson de la Couldre", ville: "Trappes", code_postal: 78192 },
  { destinataire: "Restaurant Les Grands Duc", rue: "3 avenue de la porte Maillot", ville: "Paris", code_postal: "75116" },
  { destinataire: "Societe Sanofis", rue: "avenue des Champs", ville: "Bruxelles" },
  { destinataire: "Traiteur Sanofis Paris", rue: "16 rue Jean Jaures", ville: "Paris", code_postal: "75009" }
]

Produit.create [
  { ref: "FG128", nom: "Bloc de foie gras 3*", puht: 20, quantite: 250 , unite: "gramme", duree_conservation: 14 },
  { ref: "S40", nom: "Saumon fume sauvage pretanche", puht: 28.5, quantite: 1000 , unite: "gramme", duree_conservation: 20 },
  { ref: "T12", nom: "Terrine de lapin", puht: 12, quantite: 1000 , unite: "gramme", duree_conservation: 6 },
  { ref: "T13", nom: "Terrine de lapin aux morilles", puht: 15, quantite: 1000 , unite: "gramme", duree_conservation: 4 },
  { ref: "T25", nom: "Terrine de lievre aux noisettes", puht: 18.50, quantite: 1000 , unite: "gramme", duree_conservation: 4 },
  { ref: "T110", nom: "Lot de 3 terrine", puht: 41.50 },
  { ref: "AG01", nom: "Amuse gueule n1", puht: 15, quantite: 100, duree_conservation: 10 },
  { ref: "AG02", nom: "Amuse gueule n2", puht: 15, quantite: 100, duree_conservation: 10 },
  { ref: "AG100", nom: "Lot de 1000 amuses gueule", puht: 135 }
]

Agence.create [
  { nom: "Agence parisienne" },
  { nom: "Agence lyonnaise" }
]

Agence.find_by_nom( "Agence parisienne" ).adresse = Adresse.find_by_destinataire "Societe Canard Dodu"
Agence.find_by_nom( "Agence lyonnaise" ).adresse = Adresse.find_by_destinataire "Agence Canard Dodu"

Produit.where{ nom.like 'amuse%' }.each do |amuse_gueule|
  Lot.create( { ref_produit: amuse_gueule.ref, quantite: 2, ref_lot: "AG100" } )
end

Produit.where{ nom.like 'terrine%' }.each do |terrine|
  Lot.create( { ref_produit: terrine.ref, quantite: 2, ref_lot: "T110" } )
end

Produit.all.each do |produit|
  Agence.all.each do |agence|
    s = Stock.create( { quantite_disponible: 50, date_fabrication: Time.now } )
    s.produit = produit
    s.agence = agence
  end
end

Client.create[
  { raison_sociale: "Restaurant Les Grands Ducs" },
  { raison_sociale: "Sanofis Traiteur SARL", site_web: "www.sanofis.com" }
]

ContactClient.create[
  { email: "marcel.durand-lesgrandsducs@yahoo.com", prenom: "Marcel", nom: "Durand", telephone: "0147869090", position: "Responsable des achats" },
  { email: "charlotte.legrand@sanofis-traiteur.com", nom: "Legrand", prenom: "Charlotte", telephone: "0652831780", position: "Directrice commerciale" }
]

ducs = Client.find_by_raison_sociale( "Restaurant Les Grands Ducs" )
ducs.adresse = Adresse.where( destinataire: "Restaurant Les Grands Ducs" ).first
ducs.ristournes.create[
  { ca_min: 45000, ca_max: 90000, valeur: 3 },
  { ca_min: 90000, valeur: 5 }
]
durand = Utilisateur.find_by_nomd "Durand"
durand.adresse = ducs.adresse
durand.client = ducs

sanofis = Client.find_by_raison_sociale( "Sanofis Traiteur SARL" )
sanofis.adresse = Adresse.where( destinataire: "Societe Sanofis" ).first
sanofis.ristournes.create[
  { ca_min: 30000, ca_max: 50000, valeur: 2 },
  { ca_min: 50000, ca_max: 90000, valeur: 4.5 },
  { ca_min: 90000, valeur: 7.3 }
]
legrand = Utilisateur.find_by_nom "Legrand"
legrand.adresse = Adresse.where( destinataire: "Traiteur Sanofis Paris" ).first
legrand.client = sanofis
