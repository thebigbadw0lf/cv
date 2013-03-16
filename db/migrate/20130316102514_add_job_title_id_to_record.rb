class AddJobTitleIdToRecord < ActiveRecord::Migration
  def change
    add_column :records, :job_title_id, :integer
  end
end
