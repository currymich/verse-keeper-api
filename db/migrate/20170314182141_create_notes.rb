class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :text
      t.references :user, foreign_key: true
      t.references :verse, foreign_key: true

      t.timestamps
    end
  end
end
