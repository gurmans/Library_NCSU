class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :program
  belongs_to :university
  validates :name , presence: true
  validates :password , presence: true
  validates :email , presence: true , uniqueness: true
  validates :university_id, presence: true
  validates :program_id , presence: true

  has_many :hold_book_trackers, :dependent => :destroy
end
