class CreateCommandes < ActiveRecord::Migration
  def change
    create_table :commandes do |t|
      t.references :client
      t.timestamp :date_livraison

      t.timestamps
    end
    add_index :commandes, :client_id
  end
end
