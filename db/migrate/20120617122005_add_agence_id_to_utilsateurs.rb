class AddAgenceIdToUtilsateurs < ActiveRecord::Migration
  def change
    add_column :utilisateurs, :agence_id, :integer
    add_index :utilisateurs, :agence_id
  end
end
