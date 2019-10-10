class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, :recoverable, :rememberable, :validatable,omniauth_providers: [:google_oauth2]
  belongs_to :program
  belongs_to :university
  #validates :name , presence: true
  #validates :password , presence: true
  #validates :email , presence: true , uniqueness: true
  #validates :university_id, presence: true
  #validates :program_id , presence: true

  has_many :hold_book_trackers, :dependent => :destroy
  has_many :books, :dependent => :restrict_with_error

  def password_required?
    super && provider.blank?
  
  end


end

