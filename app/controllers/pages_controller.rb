class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @books = Book.last(6)
  end

end
