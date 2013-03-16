class CreateJobTitles < ActiveRecord::Migration
  def change
    create_table :job_titles do |t|
      t.integer :id
      t.string :title_short
      t.string :title_long

      t.timestamps
    end
  end
end
