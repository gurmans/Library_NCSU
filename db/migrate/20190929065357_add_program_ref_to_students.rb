class AddProgramRefToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :program, foreign_key: true
  end
end
