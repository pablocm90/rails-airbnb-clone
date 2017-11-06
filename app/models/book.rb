class Book < ApplicationRecord
  belongs_to :author
  validates :price, numericality: true
  validates :title, presence: true
  validates :genre, presence: true
  validates :cover_pic, presence: true
  validates :publisher, presence: true
  validates :author, presence: true
  validates :synopsys, presence: true, length: { minimum: 60, maximum: 500 }

end
