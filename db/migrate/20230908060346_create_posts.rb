class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.string :store
      t.string :menu
      t.text :impressions
      t.string :address
      t.timestamps
    end
  end
end
