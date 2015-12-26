class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources, {:primary_key => :resource_id} do |t|
      t.index :resource_id
      t.string :name
      t.string :logo
      t.string :website
      t.string :affilatelink
      t.boolean :affiliate

      t.timestamps
    end
  end
end
