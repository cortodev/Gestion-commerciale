class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.float :valeur
      t.string :unite
      t.references :promotionable, polymorphic: true
      t.references :produit

      t.timestamps
    end
    add_index :promotions, [:promotionable_id, :promotionable_type]
    add_index :promotions, :produit_id
  end
end
