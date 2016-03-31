class ChangeDescToText < ActiveRecord::Migration
  def change
    change_column :places, :desc, :text
  end
end
