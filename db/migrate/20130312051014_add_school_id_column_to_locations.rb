class AddSchoolIdColumnToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :school_id, :integer
  end
end
