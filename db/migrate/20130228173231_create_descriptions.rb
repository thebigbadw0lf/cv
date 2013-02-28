class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :description_short
      t.text :description_long

      t.timestamps
    end
  end
end
