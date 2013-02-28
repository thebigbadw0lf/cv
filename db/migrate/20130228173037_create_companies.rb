class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :short_name
      t.integer :min_employees
      t.integer :max_employees
      t.string :link
      t.string :logo_link

      t.timestamps
    end
  end
end
