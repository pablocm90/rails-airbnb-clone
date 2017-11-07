class BooksController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :search_by_author, :search_by_title, :search_by_genre, :show]
  before_action :set_book, only: [:show, :buy]

  def index
    @authors = Author.all
    @genres = ["mystery", "thriller", "erotic", "crime", "fantasy"]
    @books = Book.all
    @books = @books.sort_by { |hash| hash['publication_year'] }.reverse
  end

  def search
    if params[:query].present?
      @books = Book.search(params[:query])
      @books = @books.sort_by { |hash| hash['publication_year'] }.reverse
    else
      @books = Book.all
    end
  end

  def show
  end

  def buy

  end


  private

  def set_book
    @book = Book.find(params[:id])
  end

end
