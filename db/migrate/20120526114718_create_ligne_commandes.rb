class CreateLigneCommandes < ActiveRecord::Migration
  def change
    create_table :ligne_commandes do |t|
      t.integer :quantite
      t.references :produit
      t.references :commande

      t.timestamps
    end
    add_index :ligne_commandes, :commande_id
  end
end
