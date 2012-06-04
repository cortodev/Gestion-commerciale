class CreateLigneCommandes < ActiveRecord::Migration
  def change
    create_table :ligne_commandes do |t|
      t.references :produit
      t.references :commande
      t.integer :quantite

      t.timestamps
    end
    add_index :ligne_commandes, :commande_id
  end
end
