class AddAvailableToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :available, :integer
  end
end
