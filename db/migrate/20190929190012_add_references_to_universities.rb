class AddReferencesToUniversities < ActiveRecord::Migration[5.2]
  def change
    add_reference :libraries, :university, foreign_key: true
  end
end
