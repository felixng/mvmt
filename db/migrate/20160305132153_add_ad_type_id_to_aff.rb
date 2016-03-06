class AddAdTypeIdToAff < ActiveRecord::Migration
  def change
    add_reference :affiliates, :ad_type, index: true
  end
end
