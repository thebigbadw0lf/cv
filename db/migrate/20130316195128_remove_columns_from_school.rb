class RemoveColumnsFromSchool < ActiveRecord::Migration
  def up
    remove_column :schools, :start_date
    remove_column :schools, :end_date
    remove_column :schools, :degree
    remove_column :schools, :degree_short
  end

  def down
    add_column :schools, :degree_short, :string
    add_column :schools, :degree, :string
    add_column :schools, :end_date, :date
    add_column :schools, :start_date, :date
  end
end
