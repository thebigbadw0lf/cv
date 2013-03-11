class AddNameShortColumnToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :name_short, :string
  end
end
