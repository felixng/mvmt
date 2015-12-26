class RemoveColumnsFromResource < ActiveRecord::Migration
  def change
    remove_column :resources, :affilatelink, :string
    remove_column :resources, :affiliate, :boolean
  end
end
