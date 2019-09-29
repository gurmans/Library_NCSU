class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
	rename_column :students, :passwrod, :password
        rename_column :librarians,:passwrod,:password	
  end
end
