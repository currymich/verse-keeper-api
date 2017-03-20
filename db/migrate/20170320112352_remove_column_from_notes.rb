class RemoveColumnFromNotes < ActiveRecord::Migration[5.0]
  def change
    remove_reference :notes, :user
  end
end
