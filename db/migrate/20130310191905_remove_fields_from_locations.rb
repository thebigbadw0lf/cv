class RemoveFieldsFromLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :latitude
    remove_column :locations, :longitude
  end

  def down
    add_column :locations, :longitude, :decimal
    add_column :locations, :latitude, :decimal
  end
end
