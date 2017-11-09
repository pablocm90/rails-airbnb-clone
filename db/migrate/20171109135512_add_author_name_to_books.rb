class AddAuthorNameToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :author_name, :string
  end
end
