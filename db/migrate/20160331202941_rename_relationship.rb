class RenameRelationship < ActiveRecord::Migration
  def change
    rename_table :categories_resources, :categories_places
    rename_column :categories_places, :resource_id, :place_id
  end
end
