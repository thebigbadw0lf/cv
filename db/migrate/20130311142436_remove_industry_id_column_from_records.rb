class RemoveIndustryIdColumnFromRecords < ActiveRecord::Migration
  def up
    remove_column :records, :industry_id
  end

  def down
    add_column :records, :industry_id, :string
  end
end
