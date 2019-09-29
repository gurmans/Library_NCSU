class University < ApplicationRecord
  has_many :libraries, dependent: :destroy
end
