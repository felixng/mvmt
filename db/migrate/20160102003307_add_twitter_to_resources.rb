class AddTwitterToResources < ActiveRecord::Migration
  def change
    add_column :resources, :twitter, :string
  end
end
