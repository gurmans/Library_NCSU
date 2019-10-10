class StudentsController < ApplicationController
  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy]
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        #ExampleMailer.send_email(@student).deliver_now
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_overdue_students
    @checkedoutBooks = BookHistory.where(:returnDate => nil).to_a
    @checkedoutBooks&.delete_if {|book| book.dueDate != nil and book.dueDate >= Date.current}
    @checkedoutBooks.concat BookHistory.where.not(:overdue_amount => nil).to_a
    if librarian_signed_in?
      @checkedoutBooks&.delete_if {|bookhistory| Book.find(bookhistory.book_id).library_id != current_librarian.library_id}
    end
    @students = @checkedoutBooks&.map {|entry| Student.where(:id =>entry.student_id)&.first}.compact.uniq
      # @students = Student.where.not(:overdueFromReturnedBooks => nil)&.to_a
      # @students.concat Student.where(:id => BookHistory.where(:returnDate => nil)&.map { |history| history.student_id })&.to_a
    # if librarian_signed_in?
    #   @students.uniq!.delete_if { |student| student.university_id != current_librarian.library.university_id}
    # end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :password, :email, :bookmarks, :university_id, :program_id, :password_confirmation)
    end
end
