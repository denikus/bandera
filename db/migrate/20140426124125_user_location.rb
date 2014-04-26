class UserLocation < ActiveRecord::Migration
  def up
    add_column :users, :city, :string
    add_column :users, :country, :string
  end

  def down
    remove_column :users, :city, :string
    remove_column :users, :country, :string
    end
end
