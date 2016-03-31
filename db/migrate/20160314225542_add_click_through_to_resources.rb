class AddClickThroughToResources < ActiveRecord::Migration
  def change
    add_column :places, :fetch, :bool
    add_column :places, :clickthrough, :integer, :default => 0
  end
end
