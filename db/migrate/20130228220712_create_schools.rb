class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.string :degree
      t.string :degree_short
      t.integer :location_id
      t.string :link
      t.string :logo_link

      t.timestamps
    end
  end
end