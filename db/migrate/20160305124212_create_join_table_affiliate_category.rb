class CreateJoinTableAffiliateCategory < ActiveRecord::Migration
  def change
    create_join_table :affiliates, :categories do |t|
      # t.index [:affiliate_id, :category_id]
      # t.index [:category_id, :affiliate_id]
    end
  end
end
