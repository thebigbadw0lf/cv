class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :name
      t.string :short_name
      t.string :link

      t.timestamps
    end
  end
end
