class AddInstagramAndDescToRosource < ActiveRecord::Migration
  def change
    add_column :resources, :instagram, :string
    add_column :resources, :desc, :string
  end
end
