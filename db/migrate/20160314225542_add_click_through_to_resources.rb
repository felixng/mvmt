class AddClickThroughToResources < ActiveRecord::Migration
  def change
    add_column :resources, :fetch, :bool
    add_column :resources, :clickthrough, :integer, :default => 0
  end
end
