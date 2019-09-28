class CreateBookHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_histories do |t|
      t.date :issueDate
      t.date :returnDate

      t.timestamps
    end
  end
end
