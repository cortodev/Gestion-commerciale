class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :raison_sociale
      t.string :categorie_juridique
      t.string :naf_2008
      t.string :naf_2003
      t.string :siren
      t.string :site_web
      t.text :commentaires

      t.timestamps
    end
  end
end
