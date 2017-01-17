class RenamePageIdToFacebookId < ActiveRecord::Migration[5.0]
  def change
    rename_column :pages, :page_id, :facebook_id
    add_index :pages, :facebook_id, unique: true
  end
end
