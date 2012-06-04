Adresse.create [
  { destinataire: "Societe Canard Dodu", rue: "rue du Canard", ville: "Paris", code_postal: 75000 },
  { destinataire: "Agence Canard Dodu", rue: "rue Dodu", ville: "Lyon", code_postal: 69000 },
  { destinataire: "Usine Canard Dodu", rue: "rue des Conserves", complement: "Z.A. du Buisson de la Couldre", ville: "Trappes", code_postal: 78192 },
  { destinataire: "Restaurant St-Ferdinand", rue: "3 avenue de la porte Maillot", ville: "Paris", code_postal: "75116" }
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

Agence.find_by_nom( "Agence parisienne" ).adresse = Adresse.where( destinataire: "Societe Canard Dodu" ).first
Agence.find_by_nom( "Agence lyonnaise" ).adresse = Adresse.where( destinataire: "Agence Canard Dodu" ).first

Produit.where{ nom.like 'amuse%' }.each do |amuse_gueule|
  Lot.create( { ref_produit: amuse_gueule.ref, quantite: 2, ref_lot: "AG100" } )
end

Produit.where{ nom.like 'terrine%' }.each do |terrine|
  Lot.create( { ref_produit: terrine.ref, quantite: 2, ref_lot: "T110" } )
end
