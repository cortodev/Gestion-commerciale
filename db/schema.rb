# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120609131642) do

  create_table "adresses", :force => true do |t|
    t.string   "destinataire"
    t.string   "rue"
    t.string   "ville"
    t.string   "complement"
    t.string   "pays",             :default => "France"
    t.integer  "code_postal"
    t.integer  "localisable_id"
    t.string   "localisable_type"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "adresses", ["localisable_id", "localisable_type"], :name => "index_adresses_on_localisable_id_and_localisable_type"

  create_table "agences", :force => true do |t|
    t.string   "nom"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "raison_sociale"
    t.string   "categorie_juridique"
    t.string   "naf_2008"
    t.string   "naf_2003"
    t.string   "siren"
    t.string   "site_web"
    t.text     "commentaires"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "commandes", :force => true do |t|
    t.datetime "date_livraison"
    t.integer  "contact_client_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "commandes", ["contact_client_id"], :name => "index_commandes_on_contact_client_id"

  create_table "contact_clients", :id => false, :force => true do |t|
    t.integer  "client_id"
    t.integer  "commercial_id"
    t.integer  "utilisateur_id"
    t.datetime "date_dernier_contact"
  end

  add_index "contact_clients", ["client_id"], :name => "index_contact_clients_on_client_id"
  add_index "contact_clients", ["commercial_id"], :name => "index_contact_clients_on_commercial_id"
  add_index "contact_clients", ["utilisateur_id"], :name => "index_contact_clients_on_utilisateur_id", :unique => true

  create_table "employes", :id => false, :force => true do |t|
    t.float    "salaire"
    t.string   "type_contrat"
    t.string   "type"
    t.datetime "date_embauche"
    t.integer  "agence_id"
    t.integer  "utilisateur_id"
  end

  add_index "employes", ["agence_id"], :name => "index_employes_on_agence_id"
  add_index "employes", ["utilisateur_id"], :name => "index_employes_on_utilisateur_id", :unique => true

  create_table "ligne_commandes", :force => true do |t|
    t.integer  "quantite"
    t.integer  "produit_id"
    t.integer  "commande_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ligne_commandes", ["commande_id"], :name => "index_ligne_commandes_on_commande_id"

  create_table "lots", :force => true do |t|
    t.string   "ref_lot"
    t.string   "ref_produit"
    t.integer  "quantite"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "lots", ["ref_lot"], :name => "index_lots_on_ref_lot"
  add_index "lots", ["ref_produit"], :name => "index_lots_on_ref_produit"

  create_table "produits", :force => true do |t|
    t.string   "ref"
    t.string   "nom"
    t.string   "tva"
    t.float    "puht"
    t.integer  "quantite",           :default => 1
    t.integer  "duree_conservation"
    t.string   "unite"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "promotions", :force => true do |t|
    t.float    "valeur"
    t.string   "unite"
    t.integer  "promotionable_id"
    t.string   "promotionable_type"
    t.integer  "produit_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "promotions", ["produit_id"], :name => "index_promotions_on_produit_id"
  add_index "promotions", ["promotionable_id", "promotionable_type"], :name => "index_promotions_on_promotionable_id_and_promotionable_type"

  create_table "ristournes", :force => true do |t|
    t.integer  "ca_min"
    t.integer  "ca_max"
    t.float    "valeur"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ristournes", ["client_id"], :name => "index_ristournes_on_client_id"

  create_table "stocks", :force => true do |t|
    t.float    "quantite_disponible"
    t.string   "unite"
    t.datetime "date_fabrication"
    t.datetime "date_peremption"
    t.integer  "agence_id"
    t.integer  "produit_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "stocks", ["agence_id"], :name => "index_stocks_on_agence_id"
  add_index "stocks", ["produit_id"], :name => "index_stocks_on_produit_id"

  create_table "utilisateurs", :force => true do |t|
    t.integer  "roles_mask"
    t.string   "nom"
    t.string   "prenom"
    t.string   "email"
    t.string   "telephone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "position"
    t.string   "password_digest"
    t.datetime "date_contact"
  end

end
