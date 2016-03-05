class CreateAdTypes < ActiveRecord::Migration
  def change
    create_table :ad_types do |t|
      t.string :name
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end
end
