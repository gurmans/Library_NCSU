class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :ISBN
      t.string :title
      t.string :Author
      t.string :language
      t.string :published
      t.string :edition
      t.string :image
      t.text :summary
      t.boolean :specialCollection
      t.date :returnDate
      t.timestamps
    end
  end
end
