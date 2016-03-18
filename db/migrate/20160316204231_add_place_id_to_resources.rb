class AddPlaceIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :placeId, :string, :default => -1
  end
end
