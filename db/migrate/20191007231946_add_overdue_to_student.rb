class AddOverdueToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :overdueFromReturnedBooks, :decimal
  end
end
