class CreateProgramMapAllowedBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :program_map_allowed_books do |t|
      t.int :maxNumberOfBooksIssuable

      t.timestamps
    end
  end
end
