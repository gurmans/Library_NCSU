class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :student, foreign_key: true
    add_reference :books, :library, foreign_key: true

    add_reference :book_histories, :book, foreign_key: true
    add_reference :book_histories, :student, foreign_key: true

    add_reference :librarians, :library, foreign_key: true

    add_reference :students, :program, foreign_key: true
    add_reference :students, :university, foreign_key: true
  end
end
