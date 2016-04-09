class AddDefaultValue < ActiveRecord::Migration
  def change
    change_column_default :places, :facebook, ''
    change_column_default :places, :instagram, ''
    change_column_default :places, :twitter, ''
    change_column_default :places, :website, ''
    change_column_default :places, :postcode, ''
    change_column_default :places, :desc, ''

  end
end
