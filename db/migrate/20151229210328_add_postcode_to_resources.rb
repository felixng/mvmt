class AddPostcodeToResources < ActiveRecord::Migration
  def change
    add_column :resources, :postcode, :string
  end
end
