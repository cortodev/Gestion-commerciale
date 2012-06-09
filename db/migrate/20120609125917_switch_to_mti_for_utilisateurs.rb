class SwitchToMtiForUtilisateurs < ActiveRecord::Migration
  def change
    remove_column :utilisateurs, :commercial_id
    remove_column :utilisateurs, :client_id
    remove_column :utilisateurs, :type
  end
end
