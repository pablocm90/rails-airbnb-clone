class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.references :user, foreign_key: true
      t.string :profile_picture
      t.string :description
      t.string :currency
      t.date :birthday

      t.timestamps
    end
  end
end
