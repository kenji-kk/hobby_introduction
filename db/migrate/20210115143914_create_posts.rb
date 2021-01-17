class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :genre
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
