class RemoveJobTitleFromRecord < ActiveRecord::Migration
  def up
    remove_column :records, :job_title
  end

  def down
    add_column :records, :job_title, :string
  end
end
