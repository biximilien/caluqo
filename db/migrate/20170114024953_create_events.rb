class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
