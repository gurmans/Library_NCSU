class AddDueDateToBookHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :book_histories, :dueDate, :date
  end
end
