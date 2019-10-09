class LibrariansController < ApplicationController
  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy]
  before_action :set_librarian, only: [:show, :edit, :update, :destroy]

  # GET /librarians
  # GET /librarians.json
  def index
    @librarians = Librarian.all
  end

  # GET /librarians/1
  # GET /librarians/1.json
  def show
  end

  # GET /librarians/new
  def new
    @librarian = Librarian.new
  end

  # GET /librarians/1/edit
  def edit
  end

  # POST /librarians
  # POST /librarians.json
  def create
    @librarian = Librarian.new(librarian_params)

    respond_to do |format|
      if @librarian.save
        format.html { redirect_to @librarian, notice: 'Librarian was successfully created.' }
        format.json { render :show, status: :created, location: @librarian }
      else
        format.html { render :new }
        format.json { render json: @librarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /librarians/1
  # PATCH/PUT /librarians/1.json
  def update
    respond_to do |format|
      if @librarian.update(librarian_params)
        format.html { redirect_to @librarian, notice: 'Librarian was successfully updated.' }
        format.json { render :show, status: :ok, location: @librarian }
      else
        format.html { render :edit }
        format.json { render json: @librarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /librarians/1
  # DELETE /librarians/1.json
  def destroy
    @librarian.destroy
    respond_to do |format|
      format.html { redirect_to librarians_url, notice: 'Librarian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #POST
  def handleSpecialCollectionRequest
    respond_to do |format|
      if params[:book_id].present? and params[:student_id].present? and params[:approve].present?
	    if HoldBookTracker.handleSpecialCollectionRequest?(params[:book_id],params[:student_id],params[:approve])
			if params[:approve] == true
				redirectWithMessage(format, pages_librarianhome_path(), 'Special collection request approved successfully.')
			elsif params[:approve] == false
				redirectWithMessage(format, pages_librarianhome_path(), 'Special collection request rejected successfully.')
			end	
		else
			redirectWithMessage(format, pages_librarianhome_path(), 'Special collection request could not be handled due to some error')
		end
	  else
		redirectWithMessage(format, pages_librarianhome_path(), 'Special collection request could not be handled due to some error')
      end	  
    end	
  end   
  private
  
	def redirectWithMessage(format, destination, message)
		format.html { redirect_to destination, notice: message }
		format.json { render :show, status: :ok, location: destination }
	end
    # Use callbacks to share common setup or constraints between actions.
    def set_librarian
      @librarian = Librarian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def librarian_params
      params.require(:librarian).permit(:name, :password, :email, :bookmarks, :library_id, :password_confirmation)
    end
end
