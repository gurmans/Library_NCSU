class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :program
  belongs_to :university
  has_many :hold_book_trackers, :dependent => :destroy
  has_many :books, :dependent => :restrict_with_error
end
