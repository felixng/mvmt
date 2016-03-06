class AddAdTypeIdToAff < ActiveRecord::Migration
  def change
    add_column :affiliates, :ad_types_id, :integer
    add_index  :affiliates, :ad_types_id
  end
end
