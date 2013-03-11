class CreateIndustriesCompaniesTable < ActiveRecord::Migration
  
  def up
    create_table :industries_companies, :id => false do |t|
      t.integer :industry_id
      t.integer :company_id
    end
    
    change_table :industries_companies do |t|
      t.index :industry_id, :unique => false
      t.index :company_id, :unique => false
    end
  end
  
  def down
    drop_table :industries_companies
  end
end
