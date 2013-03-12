class RemoveCompanyIdColumnFromRecords < ActiveRecord::Migration
  def up
    remove_column :records, :company_id
  end

  def down
    add_column :records, :company_id, :integer
  end
end
