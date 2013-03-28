class CreateLinkedInShares < ActiveRecord::Migration
  def change
    create_table :linked_in_shares do |t|
      t.string :url
      t.string :picture_url
      t.string :first_name
      t.string :last_name
      t.string :headline
      t.string :comment
      t.string :comment_short_url

      t.timestamps
    end
  end
end
