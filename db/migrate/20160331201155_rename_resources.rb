class RenameResources < ActiveRecord::Migration
  def change
    rename_table :resources, :places
  end
end
