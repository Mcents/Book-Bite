class ChangeIsbnToString < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :isbn, :text
  end
end
