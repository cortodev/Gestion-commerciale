class CreateCommandes < ActiveRecord::Migration
  def change
    create_table :commandes do |t|
      t.timestamp :date_livraison
      t.references :contact_client

      t.timestamps
    end
    add_index :commandes, :contact_client_id
  end
end
