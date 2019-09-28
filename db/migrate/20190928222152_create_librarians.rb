class CreateLibrarians < ActiveRecord::Migration[5.2]
  def change
    create_table :librarians do |t|
      t.string :name
      t.string :passwrod
      t.string :email
      t.string :bookmarks

      t.timestamps
    end
  end
end
