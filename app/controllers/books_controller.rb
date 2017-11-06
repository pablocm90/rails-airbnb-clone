class BooksController < ApplicationController
  def index
    @books = Book.all
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
