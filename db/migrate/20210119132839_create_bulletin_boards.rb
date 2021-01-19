class CreateBulletinBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :bulletin_boards do |t|
      t.integer :post_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
