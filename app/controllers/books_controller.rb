class BooksController < ApplicationController

  #skip_before_action :authenticate_user!, only: [:index, :search_by_author, :search_by_title, :search_by_genre, :show]

  def index
    @authors = Author.all
    @genres = ["mystery", "thriller", "erotic", "crime", "fantasy"]
    @books = Book.all
    @books = @books.sort_by { |hash| hash['publication_year'] }.reverse
  end

  def search
    @books = Book.search(params[:query])
    @books = @books.sort_by { |hash| hash['publication_year'] }.reverse
  end

  def show
    @book = Book.find(params[:id])
  end
end
