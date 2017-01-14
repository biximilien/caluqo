class AddFacebookIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :facebook_id, :bigint
    add_index :events, :facebook_id, unique: true
  end
end
