class AddLoggings < ActiveRecord::Migration
  def change
    add_column :places, :last_fetch, :date
  end
end
