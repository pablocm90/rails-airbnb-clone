class Author < ApplicationRecord
  mount_uploader :profile_picture, PhotoUploader
  belongs_to :user
  has_many :books
  has_many :book_transactions, through: :books
  has_many :reviews, through: :books
  validates :currency, presence: true
end
