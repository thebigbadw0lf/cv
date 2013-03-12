class AddRecordIdColumnToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :record_id, :integer
  end
end
