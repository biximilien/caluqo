class AddPageIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :page_id, :integer
    add_index :events, :page_id
  end
end
