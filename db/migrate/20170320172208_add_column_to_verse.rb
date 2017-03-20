class AddColumnToVerse < ActiveRecord::Migration[5.0]
  def change
    add_column :verses, :reference, :string
  end
end
