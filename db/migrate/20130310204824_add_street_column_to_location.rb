class AddStreetColumnToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :street, :string
  end
end
