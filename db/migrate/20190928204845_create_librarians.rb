class CreateLibrarians < ActiveRecord::Migration[5.2]
  def change
    create_table :librarians do |t|
      t.string :name
      t.password :passwrod
      t.email :email
      t.json :bookmarks

      t.timestamps
    end
  end
end
