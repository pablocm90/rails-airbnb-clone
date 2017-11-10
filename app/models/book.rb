class Book < ApplicationRecord
  mount_uploader :cover_pic, PhotoUploader

  belongs_to :author
  has_many :reviews
  has_many :book_transactions


  validates :price, numericality: true
  validates :title, presence: true
  validates :genre, presence: true
  validates :cover_pic, presence: true
  validates :publisher, presence: true
  validates :author, presence: true
  validates :synopsys, presence: true

  include AlgoliaSearch

  algoliasearch do
    attribute :title, :genre, :publisher, :synopsys, :author_name
    searchableAttributes ['title', 'genre', 'synopsys', 'publisher', 'author_name']
    minWordSizefor1Typo 4
    minWordSizefor2Typos 8
    # To Do: custom ranking (customRanking ['desc(likes_count)'])
  end

  # def self.search(search)
  #   books_title = where("title LIKE ?", "%#{search}%")
  #   books_genre = where("genre LIKE ?", "%#{search}%")
  #   books_synopsys = where("synopsys LIKE ?", "%#{search}%")
  #   books_result = books_title + books_genre + books_synopsys
  #   return books_result
  # end


end
