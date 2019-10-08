class AddSubjectToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :subject, :string
  end
end
