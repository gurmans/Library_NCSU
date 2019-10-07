class RemoveReturnDateFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :returnDate, :date
  end
end
