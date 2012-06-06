class AddPositionToUtilisateurs < ActiveRecord::Migration
  def change
    add_column :utilisateurs, :position, :string
  end
end
