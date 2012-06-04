class CreateAgences < ActiveRecord::Migration
  def change
    create_table :agences do |t|
      t.string :nom
      t.references :adresse

      t.timestamps
    end
    add_index :agences, :adresse_id
  end
end
