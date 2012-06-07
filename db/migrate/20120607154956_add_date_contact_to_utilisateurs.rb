class AddDateContactToUtilisateurs < ActiveRecord::Migration
  def change
    add_column :utilisateurs, :date_contact, :timestamp
  end
end
