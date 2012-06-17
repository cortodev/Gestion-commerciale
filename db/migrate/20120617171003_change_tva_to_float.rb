class ChangeTvaToFloat < ActiveRecord::Migration
  def change
    change_table :produits do |t|
      t.remove :tva
      t.float :tva
    end
  end
end
