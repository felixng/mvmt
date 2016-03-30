class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.text :desc
      t.string :code
      t.string :link
      t.date :startDate
      t.date :endDate

      t.timestamps
    end

    add_attachment :offers, :image
  end
end
