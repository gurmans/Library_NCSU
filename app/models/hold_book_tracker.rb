class HoldBookTracker < ApplicationRecord
  belongs_to :book
  belongs_to :student
end
