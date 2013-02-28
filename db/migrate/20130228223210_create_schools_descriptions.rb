class CreateSchoolsDescriptions < ActiveRecord::Migration
  def change
    create_table :schools_descriptions, :id => false do |t|
      t.integer :school_id
      t.integer :description_id
    end
    
    change_table :schools_descriptions do |t|
      t.index :school_id, :unique => false
      t.index :description_id, :unique => false
    end
  end
end