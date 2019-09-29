class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :account, foreign_key: true
    add_reference :books, :library, foreign_key: true

    add_reference :book_histories, :book, foreign_key: true
    add_reference :book_histories, :account, foreign_key: true

    add_reference :librarians, :account, foreign_key: true
    add_reference :librarians, :library, foreign_key: true

    add_reference :students, :account, foreign_key: true
    add_reference :students, :program, foreign_key: true
    add_reference :students, :university, foreign_key: true
  end
end
