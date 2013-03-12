class RemoveLocationIdColumnFromSchools < ActiveRecord::Migration
  def up
    remove_column :schools, :location_id
  end

  def down
    add_column :schools, :location_id, :integer
  end
end
