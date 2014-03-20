class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos, force: true do |t|
      t.belongs_to :user, :index => true
      t.string :url, :null => false
      t.string :hash_id, :null => false
      t.timestamps
    end
    add_index :videos, :hash_id
  end

  def down
    drop_table :videos
  end
end
