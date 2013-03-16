class CreateDescriptionsEducationRecords < ActiveRecord::Migration
  def up
    create_table :descriptions_education_records, :id => false do |t|
      t.integer :description_id
      t.integer :education_record_id
    end
    
    change_table :descriptions_education_records do |t|
      t.index :description_id, :unique => false
      t.index :education_record_id, :unique => false
    end
  end
  
  def down
    drop_table :descriptions_education_records
  end

end
