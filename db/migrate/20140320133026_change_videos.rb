class ChangeVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :url
    add_column    :videos, :youtube_url, :string
    add_column    :videos, :youtube_id, :string
    add_column    :videos, :youtube_embed, :text
  end

  def down
    add_column    :videos, :url, :string
    remove_column :videos, :youtube_url
    remove_column :videos, :youtube_id
    remove_column :videos, :youtube_embed
  end

end
