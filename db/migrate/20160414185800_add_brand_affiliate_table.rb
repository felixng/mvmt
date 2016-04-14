class AddBrandAffiliateTable < ActiveRecord::Migration
  def change
    add_column :brands, :affiliate_id, :integer
  end
end
