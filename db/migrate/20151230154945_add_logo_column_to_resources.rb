class AddLogoColumnToResources < ActiveRecord::Migration
  def change
    add_attachment :places, :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  end
end
