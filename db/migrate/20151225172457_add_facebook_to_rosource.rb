class AddFacebookToRosource < ActiveRecord::Migration
  def change
    add_column :resources, :facebook, :string
  end
end
