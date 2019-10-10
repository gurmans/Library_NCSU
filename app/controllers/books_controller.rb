class BooksController < ApplicationController
  before_action :authenticate!, except: [:index,:show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    if admin_signed_in?
        @book_histories = BookHistory.GetBookHistory(:admin,nil,params[:id])
    elsif librarian_signed_in?
        @book_histories = BookHistory.GetBookHistory(:librarian,nil,params[:id])
    end	
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def placeCheckoutRequest
    # HoldBookTracker.find_by_
    @book = Book.find(params[:id])	
    @student = current_student
    if @student	
    	respond_to do |format|
      		if BookHistory.checkIfAlreadyIssued?(@book.id,@student.id)
            redirectWithMessage(format, @book,'Book is already Issued.')
          elsif BookHistory.checkMaxLimitReached?(@student.id)
            redirectWithMessage(format, @book,'Max Checkout Limit Reached')
      		elsif  Book.createNewCheckoutEntry?(@book.id,@student.id) and Book.updateAvailableCounter?(@book.id,-1)
            redirectWithMessage(format, @book,'Checkout Successful.')
        	else
            redirectWithMessage(format, @book,'Your Request Could NOT be handled, please contact support staff.')
      		end
    	end
     end
  end

  def returnBook
	@book = Book.find(params[:id])
	@student = current_student
        # if @student

		respond_to do |format|
			if Book.updateExistingCheckoutEntry?(@book.id,@student.id) and Book.updateAvailableCounter?(@book.id,1)
				format.html { redirect_to @book, notice: 'Book Returned Successfully' }
				format.json { render :show, status: :ok, location: @book }
			else
				format.html { redirect_to @book, notice: 'Your Request Could NOT be handled, please contact support staff.' }
                        	format.json { render json: @book.errors, status: :unprocessable_entity }
			end
        	end	
  end

  def placeHoldRequest
    # HoldBookTracker.find_by_
    @book = Book.find(params[:id])
    @student = current_student
    respond_to do |format|
      if @book.hold_book_trackers.present? && @book.hold_book_trackers.find_by_student_id(@student.id).present?
        redirectWithMessage(format, @book, 'Hold is already Requested.')
      else @holdBookRecord = HoldBookTracker.new(book: @book, student: @student)
        if @holdBookRecord.save
          redirectWithMessage(format, @book, 'Your Request is successfully Handled.')
        else
          redirectWithMessage(format, @book, 'Your Request could NOT be handled, please contact support staff.')
      end
      end
    end
  end

  def cancelHoldRequest
    @book = Book.find(params[:id])
    respond_to do |format|
      if Book.cancelHoldRequest?(params[:id], current_student.id)
        redirectWithMessage(format, @book, 'Hold request cancelled successfully.')
      else
        redirectWithMessage(format, @book, 'Your Request could NOT be handled, please contact support staff.')
      end
    end
  end

  def remove_from_wish_list
    respond_to do |format|
      if Student.remove_from_wish_list?(params[:id], current_student.id)
        redirectWithMessage(format, Book.find(params[:id]), 'Book removed from your wish list successfully.')
      else
        redirectWithMessage(format, Book.find(params[:id]), 'Your Request could NOT be handled, please contact support staff.')
      end
    end
  end

  def addToWishList
    # HoldBookTracker.find_by_
    @book = Book.find(params[:id])
    bookmarks = current_student.bookmarks
    respond_to do |format|
      if current_student.bookmarks.present? && current_student.bookmarks.split(";").include?(params[:id])
        redirectWithMessage(format, @book, 'Book is already in your WishList.')
      else
        if bookmarks&.split(";").present? == false
          bookmarks = @book.id.to_s
        else
          bookmarks << ";" << @book.id.to_s
        end
        if current_student.update_attribute(:bookmarks,bookmarks)
          redirectWithMessage(format, @book,'Your Request is successfully Handled.')
        else
          redirectWithMessage(format, @book,'Your Request could NOT be handled, please contact support staff.')
        end
      end
    end
  end

  def display_book_history
    @book_histories = BookHistory.where(:student_id => params[:studentid]).order(returnDate: :desc).to_a
    @book_histories.select! {|history| history.overdue_amount != nil or (history.dueDate != nil and history.dueDate < Date.current)}
    @book_histories.each do |history| if history.overdue_amount == nil and book = Book.find(history.book_id)
                                        history.overdue_amount = book.library.overdueFine * (Date.current - history.dueDate).to_i
                                      end
    end
  end

  private

  def redirectWithMessage(format, destination, message)
    format.html { redirect_to destination, notice: message }
    format.json { render :show, status: :ok, location: destination }
  end

  # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:ISBN, :title, :Author, :language, :published, :bookmarks,:edition, :cover, :summary, :specialCollection,:library_id, :available, :subject)
    end

    # explicit authentication method
    def authenticate!
	:authenticate_admin! || :authenticate_librarian!	
    end		
end
