class BookmarksController < ApplicationController

  def addToArray(bookmarks)
    bookmarks&.each do |bookmark|
      book = Book.find(bookmark)
      if book.present?
        yield book
      end
    end
  end

  def index
    if student_signed_in?
    @books = []
    addToArray(current_student.bookmarks&.split(";")) { |book| @books.push book}
    end


  end

  # addToArray(bookmarks){
  #    bookmarks.each do |bookmark|
  #      book = Book.find(bookmark)
  #      if book.present?
  #        yield book
  #      end
  #    end
  # }

private
    def book_history_params
      params.require(:book_history).permit(:issueDate,:returnDate,:book_id,:student_id,:dueDate)
    end

end
