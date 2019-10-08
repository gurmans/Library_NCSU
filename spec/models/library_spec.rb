require 'rails_helper'

RSpec.describe Library, type: :model do
  context 'validation_tests' do
  	it 'ensures name presence' do
  		lib = Library.new(location:'Raleigh', bookBorrowingDaysLimit:'10', overdueFine:'10',university_id:'NC State').save
  		expect(lib).to eq(true)
  		end 
  	it 'ensures location presence' do
  		lib = Library.new(name:'James Hunt', bookBorrowingDaysLimit:'10', overdueFine:'10',university_id:'NC State').save
  		expect(lib).to eq(false)
  		end 
  	it 'ensures bookBorrowingDaysLimit presence' do
  		lib = Library.new(name:'James Hunt', location:'Raleigh', overdueFine:'10',university_id:'NC State').save
  		expect(lib).to eq(false)
  		end 
  	it 'ensures overdueFine presence' do
  		lib = Library.new(name:'James Hunt', bookBorrowingDaysLimit:'10', location:'Raleigh',university_id:'NC State').save
  		expect(lib).to eq(false)
  		end 
  	it 'ensures university_id presence' do
  		lib = Library.new(name:'James Hunt', bookBorrowingDaysLimit:'10', overdueFine:'10',location:'Raleigh').save
  		expect(lib).to eq(false)
  		end 
  	it 'should save successfully' do
  		lib = Library.new(name:'James Hunt', bookBorrowingDaysLimit:'10', overdueFine:'10',location:'Raleigh',university_id:'Nc State').save
  		expect(lib).to eq(true)
  		end 
  	end


  context 'scope tests' do

  end
end



