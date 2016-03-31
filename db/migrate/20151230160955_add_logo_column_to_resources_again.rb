require_relative '20151230154945_add_logo_column_to_resources'

class AddLogoColumnToResourcesAgain < ActiveRecord::Migration
  def change
    revert AddLogoColumnToResources

    remove_column  :places, :logo, :string

    add_attachment :places, :logo
  end
end
