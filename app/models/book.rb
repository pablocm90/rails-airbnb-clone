class Book < ApplicationRecord
  def author_username
    author_username = book.author.user.username
  end


def self.search(search)
  books_title = where("title LIKE ?", "%#{search}%")
  books_genre = where("genre LIKE ?", "%#{search}%")
  books_synopsys = where("synopsys LIKE ?", "%#{search}%")
   # where("author_username LIKE ?", "%#{search}%")
  books_result = books_title + books_genre + books_synopsys
  return books_result
end


  belongs_to :author
  has_many :reviews
  validates :price, numericality: true
  validates :title, presence: true
  validates :genre, presence: true
  validates :cover_pic, presence: true
  validates :publisher, presence: true
  validates :author, presence: true
  validates :synopsys, presence: true, length: { minimum: 60, maximum: 500 }

end
