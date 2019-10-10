class AddAprovedColumnToLibrarian < ActiveRecord::Migration[5.2]
  def change
    add_column :librarians, :approved, :boolean, :default => false
  end
end
