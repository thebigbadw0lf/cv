class RemoveSchoolIdColumnFromLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :school_id
  end

  def down
    add_column :locations, :school_id, :integer
  end
end
