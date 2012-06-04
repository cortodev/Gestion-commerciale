class CreateAdresses < ActiveRecord::Migration
  def change
    create_table :adresses do |t|
      t.string :destinataire
      t.string :rue
      t.string :ville
      t.string :complement
      t.string :pays, default: "France"
      t.integer :code_postal

      t.timestamps
    end
  end
end
