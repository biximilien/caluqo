class AddAbbreviationToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :abbreviation, :string
  end
end
