class ChangeDescToText < ActiveRecord::Migration
  def change
    change_column :resources, :desc, :text
  end
end
