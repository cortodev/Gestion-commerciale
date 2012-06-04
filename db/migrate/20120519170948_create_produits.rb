class CreateProduits < ActiveRecord::Migration
  def change
    create_table :produits do |t|
      t.string :ref
      t.string :nom
      t.string :tva
      t.float :puht
      t.integer :quantite, default: 1
      t.integer :duree_conservation #en jour
      t.string :unite

      t.timestamps
    end
  end
end
