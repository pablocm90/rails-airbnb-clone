class Author < ApplicationRecord
  mount_uploader :profile_picture, PhotoUploader
  belongs_to :user
  has_many :books
  validates :currency, presence: true

end
