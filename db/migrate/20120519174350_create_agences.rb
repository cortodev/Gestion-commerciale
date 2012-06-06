class CreateAgences < ActiveRecord::Migration
  def change
    create_table :agences do |t|
      t.string :nom

      t.timestamps
    end
  end
end
