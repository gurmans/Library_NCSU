json.extract! book, :id, :ISBN, :title, :Author, :language, :published, :edition, :image, :summary, :specialCollection, :returnDate, :created_at, :updated_at
json.url book_url(book, format: :json)
