class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :profile_picture
      t.string :description
      t.string :prefered_genre
      t.string :currency
      t.date :birthday
      t.references :user, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
