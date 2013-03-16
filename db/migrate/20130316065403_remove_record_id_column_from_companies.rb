class RemoveRecordIdColumnFromCompanies < ActiveRecord::Migration
  def up
    remove_column :companies, :record_id
  end

  def down
    add_column :companies, :record_id, :string
  end
end
