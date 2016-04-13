class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :entity
      t.string :entity_id
      t.string :action
      t.string :desc

      t.timestamps
    end
  end
end
