class Client < ApplicationRecord
  belongs_to :user
  validates length: {minumum: 60, maximum: 500}
end
