class AddApprovedToResources < ActiveRecord::Migration
  def change
    add_column :places, :approved, :bool
  end
end
