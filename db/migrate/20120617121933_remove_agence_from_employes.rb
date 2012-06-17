class RemoveAgenceFromEmployes < ActiveRecord::Migration
  def change
    remove_column :employes, :agence_id
  end
end
