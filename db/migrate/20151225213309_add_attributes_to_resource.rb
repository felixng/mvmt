class AddAttributesToResource < ActiveRecord::Migration
  def change
    add_column :places, :facebook, :string
    add_column :places, :instagram, :string
    add_column :places, :desc, :string
  end
end
