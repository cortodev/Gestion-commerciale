class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.float :quantite_disponible
      t.string :unite
      t.timestamp :date_fabrication
      t.timestamp :date_peremption
      t.references :agence
      t.references :produit

      t.timestamps
    end
    add_index :stocks, :agence_id
    add_index :stocks, :produit_id
  end
end
