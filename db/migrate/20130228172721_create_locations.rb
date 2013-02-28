class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country
      t.string :continent
      t.decimal :latitude
      t.decimal :longitude
      t.string :link

      t.timestamps
    end
  end
end
