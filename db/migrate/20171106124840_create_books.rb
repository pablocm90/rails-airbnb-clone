class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.integer :price
      t.string :title
      t.string :synopsys
      t.string :genre
      t.string :cover_pic
      t.string :publisher
      t.date :publication_year
      t.references :author, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
