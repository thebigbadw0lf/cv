class CreateEducationRecordsLocations < ActiveRecord::Migration
  def up
    create_table :education_records_locations, :id => false do |t|
      t.integer :location_id
      t.integer :education_record_id
    end
    
    change_table :education_records_locations do |t|
      t.index :location_id, :unique => false
      t.index :education_record_id, :unique => false
    end
  end
  
  def down
    drop_table :education_records_locations
  end

end
