class AddIsCertificationColumnToEducationRecord < ActiveRecord::Migration
  def change
    add_column :education_records, :is_certification, :boolean
  end
end
