class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :user_id, :null => false
      t.timestamps
    end
  end
end