class BooksController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :search_by_author, :search_by_title, :search_by_genre, :show]

  def index
    @books = Book.all
    @books = @books.sort_by { |hash| hash['publication_year'] }.reverse
    @authors = Author.all
    @genres = ["mystery", "thriller", "erotic", "crime", "fantasy"]
  end

  def search_by_author
    @books = Book.where(author_id: params[:author_id])
    @books = @books.sort_by { |hash| hash['publication_year'] }.reverse
  end

  def search_by_title
    @books = Book.where("title LIKE ?", params[:title])
    @books = @books.sort_by { |hash| hash['publication_year'] }.reverse
  end

  def search_by_genre
    @books = Book.where(genre: params[:genre])
    @books = @books.sort_by { |hash| hash['publication_year'] }.reverse
  end

  def show
    @book = Book.find(params[:id])
  end
end
