class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.String :name
      t.String :location
      t.int :bookBorrowingDaysLimit
      t.double :overdueFine

      t.timestamps
    end
  end
end
