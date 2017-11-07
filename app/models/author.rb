class Author < ApplicationRecord
  belongs_to :user
  validates :currency, presence: true, default: "eur"
end
