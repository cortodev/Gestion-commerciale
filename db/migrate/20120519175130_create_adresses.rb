class CreateAdresses < ActiveRecord::Migration
  def change
    create_table :adresses do |t|
      t.string :destinataire
      t.string :rue
      t.string :ville
      t.string :complement
      t.string :pays, default: "France"
      t.integer :code_postal
      t.references :localisable, polymorphic: true

      t.timestamps
    end

    add_index :adresses, [ :localisable_id, :localisable_type ]
  end
end
