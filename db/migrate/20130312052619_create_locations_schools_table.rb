class CreateLocationsSchoolsTable < ActiveRecord::Migration
  def up
    create_table :locations_schools, :id => false do |t|
      t.integer :location_id
      t.integer :school_id
    end
    
    change_table :locations_schools do |t|
      t.index :location_id, :unique => false
      t.index :school_id, :unique => false
    end
  end
  
  def down
    drop_table :locations_schools
  end
end
