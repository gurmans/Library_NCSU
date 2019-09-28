class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :maxNumberOfBooksIssuable

      t.timestamps
    end
  end
end
