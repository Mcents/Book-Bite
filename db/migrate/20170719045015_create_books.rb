class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :isbn
      t.string :jacket
      t.boolean :borrowed, default: false
      t.string :description
      t.references :user

      t.timestamps
    end
  end
end
