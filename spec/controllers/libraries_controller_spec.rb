require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do
	context 'GET #index' do
		it 'returns a success response' do
			get :index
			expect(response).to be_success #response.success
		end
	end


	context 'GET #show' do
		it 'returns a success response' do
			library = LibrariesController.create(name: 'General Library', location: 'Raleigh', bookBorrowingDaysLimit:'10',overdueFine: '15', university_id:'NCState')
			get :show, params: {id: library.to_param}
			expect(response). to be_success
		end
	end 
end
 