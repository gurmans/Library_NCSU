class CreateHoldBookTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :hold_book_trackers do |t|
      t.timestamps
    end
    add_reference :hold_book_trackers, :student, foreign_key: true
    add_reference :hold_book_trackers, :book, foreign_key: true
  end
end
