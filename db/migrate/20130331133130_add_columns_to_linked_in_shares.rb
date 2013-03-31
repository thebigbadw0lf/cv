class AddColumnsToLinkedInShares < ActiveRecord::Migration
  def change
    add_column :linked_in_shares, :comment_title, :text
    add_column :linked_in_shares, :comment_description, :text
  end
end
