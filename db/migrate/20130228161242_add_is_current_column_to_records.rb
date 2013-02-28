class AddIsCurrentColumnToRecords < ActiveRecord::Migration
  def change
    add_column :records, :is_current, :integer
  end
end
