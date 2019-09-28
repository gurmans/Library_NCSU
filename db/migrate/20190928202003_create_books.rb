class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.int :ISBN
      t.String :title
      t.String :Author
      t.String :language
      t.String :published
      t.String :edition
      t.String :image
      t.text :summary
      t.Boolean :specialCollection
      t.Date :returnDate

      t.timestamps
    end
  end
end
