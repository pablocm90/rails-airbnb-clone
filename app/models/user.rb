class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :book_transactions
  has_many :reviews
  has_one :client
  has_one :author
  has_many :books, through: :book_transactions
  has_many :books, through: :authors

  validates :username, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_client

  private

  def create_client
    user = self
    Client.create(user: user)
  end

end
