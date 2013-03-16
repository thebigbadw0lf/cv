class AddCompanyIdColumnToRecord < ActiveRecord::Migration
  def change
    add_column :records, :company_id, :integer
  end
end
