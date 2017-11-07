class Author < ApplicationRecord
  mount_uploader :profile_picture, PhotoUploader
  belongs_to :user
  validates :currency, presence: true
end
