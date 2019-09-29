class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :location
      t.integer :bookBorrowingDaysLimit
      t.references :university
      t.decimal :overdueFine
      t.timestamps
    end
    add_index :libraries, :university_id
  end
end
