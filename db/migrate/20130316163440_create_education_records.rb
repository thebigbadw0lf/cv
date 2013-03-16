class CreateEducationRecords < ActiveRecord::Migration
  def change
    create_table :education_records do |t|
      t.integer :id
      t.string :degree_name
      t.string :degree_short_name
      t.date :start_date
      t.date :end_date
      t.boolean :is_current

      t.timestamps
    end
  end
end
