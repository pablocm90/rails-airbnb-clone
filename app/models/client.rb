class Client < ApplicationRecord
  belongs_to :user
  validates :description, length: {minumum: 60, maximum: 500}
end
