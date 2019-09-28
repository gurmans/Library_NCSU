class CreateBookHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_histories do |t|
      t.Date :issueDate
      t.Date :returnDate

      t.timestamps
    end
  end
end
