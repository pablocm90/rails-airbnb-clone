class Client < ApplicationRecord
  mount_uploader :profile_picture, PhotoUploader
  belongs_to :user
end
