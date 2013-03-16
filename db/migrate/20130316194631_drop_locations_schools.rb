class DropLocationsSchools < ActiveRecord::Migration
  def up
    drop_table :locations_schools
  end

  def down
    create_table :locations_schools, :id => false do |t|
      t.integer :location_id
      t.integer :school_id
    end
    
    change_table :locations_schools do |t|
      t.index :location_id, :unique => false
      t.index :school_id, :unique => false
    end
  end
end
