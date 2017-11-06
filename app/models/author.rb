class Author < ApplicationRecord
  belongs_to :user
  validates :profile_picture, presence: true
  validates :currency, presence: true
end
