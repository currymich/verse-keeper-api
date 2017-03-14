class CreateVerses < ActiveRecord::Migration[5.0]
  def change
    create_table :verses do |t|
      t.string :test
      t.integer :chapter
      t.integer :verse
      t.string :book

      t.timestamps
    end
  end
end
