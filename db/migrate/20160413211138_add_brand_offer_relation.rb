class AddBrandOfferRelation < ActiveRecord::Migration
  def change
    create_join_table :offers, :brands do |t|
      # t.index [:product_id, :category_id]
      # t.index [:category_id, :product_id]
    end

  end
end
