class CreateUtilisateurs < ActiveRecord::Migration
  def change
    create_table :utilisateurs do |t|
      t.integer :roles_mask
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone
      t.string :type
      t.references :adresse
      t.references :commercial
      t.references :client

      t.timestamps
    end

    add_index :utilisateurs, :adresse_id
    add_index :utilisateurs, :commercial_id
    add_index :utilisateurs, :client_id
  end
end
