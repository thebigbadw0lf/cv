class RemoveDescriptionsSchools < ActiveRecord::Migration
  def up
    drop_table :descriptions_schools
  end

  def down
    create_table :descriptions_schools, :id => false do |t|
      t.integer :description_id
      t.integer :school_id
    end
    
    change_table :descriptions_schools do |t|
      t.index :description_id, :unique => false
      t.index :school_id, :unique => false
    end
  end
end
