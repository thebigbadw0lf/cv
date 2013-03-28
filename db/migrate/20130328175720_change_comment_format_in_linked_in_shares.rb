class ChangeCommentFormatInLinkedInShares < ActiveRecord::Migration
  def up
    change_column :linked_in_shares, :comment, :text
  end

  def down
    change_column :linked_in_shares, :comment, :string
  end
end
