class AddPasswordDigestToUtilisateurs < ActiveRecord::Migration
  def change
    add_column :utilisateurs, :password_digest, :string
  end
end
