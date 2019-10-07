class Librarian < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :library
  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates :library_id, presence: true

end
