class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :user, :index => true
      t.string :url, :null => false
      t.string :hash_id, :null => false
      t.timestamps
    end
  end
end
