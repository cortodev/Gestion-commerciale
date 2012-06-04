class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :ref_lot
      t.string :ref_produit
      t.integer :quantite

      t.timestamps
    end
    add_index :lots, :ref_lot
    add_index :lots, :ref_produit
  end
end
