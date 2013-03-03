class DescriptionsSchools < ActiveRecord::Migration
  def up
    create_table :descriptions_schools, :id => false do |t|
      t.integer :description_id
      t.integer :school_id
    end
    
    change_table :descriptions_schools do |t|
      t.index :description_id, :unique => false
      t.index :school_id, :unique => false
    end
  end
  
  def down
    drop_table :descriptions_schools
  end
end
