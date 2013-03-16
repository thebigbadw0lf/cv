class AddSchoolIdToEducationRecord < ActiveRecord::Migration
  def change
    add_column :education_records, :school_id, :integer
  end
end
