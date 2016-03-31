class RemoveColumnsFromResource < ActiveRecord::Migration
  def change
    remove_column :places, :affilatelink, :string
    remove_column :places, :affiliate, :boolean
  end
end
