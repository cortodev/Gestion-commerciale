class CreateUtilisateurs < ActiveRecord::Migration
  def change
    create_table :utilisateurs do |t|
      t.integer :roles_mask
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone
      t.string :type
      t.references :client
      t.references :commercial

      t.timestamps
    end
    add_index :utilisateurs, :client_id
    add_index :utilisateurs, :commercial_id
  end
end
