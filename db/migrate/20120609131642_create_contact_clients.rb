class CreateContactClients < ActiveRecord::Migration
  def change
    create_table :contact_clients, id: false do |t|
      t.references :client
      t.references :commercial
      t.references :utilisateur
      t.timestamp :date_dernier_contact
    end
    add_index :contact_clients, :utilisateur_id, unique: true
    add_index :contact_clients, :commercial_id
    add_index :contact_clients, :client_id
  end
end
