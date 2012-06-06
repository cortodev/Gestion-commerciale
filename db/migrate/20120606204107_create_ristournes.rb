class CreateRistournes < ActiveRecord::Migration
  def change
    create_table :ristournes do |t|
      t.integer :ca_min
      t.integer :ca_max
      t.float :valeur
      t.references :client

      t.timestamps
    end
    add_index :ristournes, :client_id
  end
end
