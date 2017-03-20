class ChangeColumnNameInVerses < ActiveRecord::Migration[5.0]
  def change
    rename_column :verses, :test, :text
    remove_column :verses, :chapter
    remove_column :verses, :book
    remove_column :verses, :verse
    
  end
end
