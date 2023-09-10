class RenamePostCommetsToPostComments < ActiveRecord::Migration[6.1]
  def change
    rename_table :post_commets, :post_comments
  end
end
