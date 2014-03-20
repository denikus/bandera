class AddHash < ActiveRecord::Migration
  def change
    add_index :videos, :hash_id
  end
end
