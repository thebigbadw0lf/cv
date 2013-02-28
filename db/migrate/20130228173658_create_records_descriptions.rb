class CreateRecordsDescriptions < ActiveRecord::Migration
  def change
    create_table :records_descriptions do |t|
      t.integer :record_id
      t.integer :description_id

      t.timestamps
    end
  end
end
