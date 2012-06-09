class CreateEmployes < ActiveRecord::Migration
  def change
    create_table :employes, id: false do |t|
      t.float :salaire
      t.string :type_contrat
      t.string :type #pour STI
      t.timestamp :date_embauche
      t.references :agence
      t.references :utilisateur
    end
    add_index :employes, :agence_id
    add_index :employes, :utilisateur_id, unique: true
  end
end
