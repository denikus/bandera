class AddLocationToVideo < ActiveRecord::Migration
  def up
    add_column :videos, :latitude, :decimal, {:precision=>10, :scale=>6}
    add_column :videos, :longitude, :decimal, {:precision=>10, :scale=>6}
    add_column :videos, :city, :string
    add_column :videos, :country, :string
  end

  def down
    remove_column :videos, :latitude
    remove_column :videos, :longitude
    remove_column :videos, :city, :string
    remove_column :videos, :country, :string
  end
end
