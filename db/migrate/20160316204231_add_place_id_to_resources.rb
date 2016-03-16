class AddPlaceIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :placeId, :string
  end
end
