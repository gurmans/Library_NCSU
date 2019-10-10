class AddOverdueAmountToBookHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :book_histories, :overdue_amount, :decimal
  end
end
