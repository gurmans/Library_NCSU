class Student < ApplicationRecord
  has_many :hold_book_trackers, :dependent => :destroy
  has_many :books, :dependent => :restrict_with_error
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :program
  belongs_to :university
  validates :name , presence: true
  # validates :password , presence: true
  validates :email , presence: true , uniqueness: true
  validates :university_id, presence: true
  validates :program_id , presence: true

  def self.remove_from_wish_list?(bookid, studentid)
    student = Student.find(studentid)
    bookmarks = student.bookmarks&.split(";")
    bookmarks&.delete(bookid.to_s)
    student.update(:bookmarks=>bookmarks&.join(";"))
  end


end
