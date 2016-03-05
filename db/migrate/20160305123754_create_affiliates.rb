class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.string :name
      t.text :adv
      t.integer :display_count
      t.integer :view_count

      t.timestamps
    end
  end
end
