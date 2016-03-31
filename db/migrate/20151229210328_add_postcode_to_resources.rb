class AddPostcodeToResources < ActiveRecord::Migration
  def change
    add_column :places, :postcode, :string
  end
end
