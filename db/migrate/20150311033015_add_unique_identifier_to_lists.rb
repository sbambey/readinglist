class AddUniqueIdentifierToLists < ActiveRecord::Migration
  def change
    add_column :lists, :unique_identifier, :string
    add_index :lists, :unique_identifier, unique: true
  end
end
