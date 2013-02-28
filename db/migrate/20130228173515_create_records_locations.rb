class CreateRecordsLocations < ActiveRecord::Migration
  def change
    create_table :records_locations do |t|
      t.integer :record_id
      t.integer :location_id

      t.timestamps
    end
  end
end
