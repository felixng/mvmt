class AddTwitterToResources < ActiveRecord::Migration
  def change
    add_column :places, :twitter, :string
  end
end
