class AddSlugToResources < ActiveRecord::Migration
  def change
    add_column :places, :slug, :string
    add_index :places, :slug
  end
end
