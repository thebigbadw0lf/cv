class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.date :start_date
      t.date :end_date
      t.string :job_title
      t.integer :company_id
      t.integer :industry_id
      t.string :link

      t.timestamps
    end
  end
end
