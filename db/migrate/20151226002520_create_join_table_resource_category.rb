class CreateJoinTableResourceCategory < ActiveRecord::Migration
  def change
    create_join_table :resources, :categories do |t|
      # t.index [:resource_id, :category_id]
      # t.index [:category_id, :resource_id]
    end
  end
end
