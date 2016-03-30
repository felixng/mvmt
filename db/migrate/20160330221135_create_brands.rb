class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title
      t.text :desc
      t.string :website

      t.timestamps
    end

    add_attachment :brands, :logo
  end
end
