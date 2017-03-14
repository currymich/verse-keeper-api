class AddReferenceToVerses < ActiveRecord::Migration[5.0]
  def change
    add_reference :verses, :user, foreign_key:true
  end
end
