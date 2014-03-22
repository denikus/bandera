class ChangeUserAvatarName < ActiveRecord::Migration
  def up
    add_column :users, :avatar_url, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_url, :string

  end

  def down
    remove_column :users, :avatar_url
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :profile_url
  end
end
