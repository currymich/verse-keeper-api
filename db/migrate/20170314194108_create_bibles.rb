class CreateBibles < ActiveRecord::Migration[5.0]
  def change
    create_table :bibles do |t|

      t.timestamps
    end
  end
end
