class BooksController < ApplicationController

  before_action :set_book, only: [ :show, :edit, :update ]
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    @authors = Author.all
    @genres = ["mystery", "thriller", "erotic", "crime", "fantasy"]
    @books = Book.all
    sort_results
  end

  def show
    @search = params[:query]
    @review = Review.new
  end

  def search
    if params[:query].present?
      @books = Book.search(params[:query])
      sort_results(@books)
    else
      @books = Book.all
    end
  end

  def new
    @book = Book.new
    @author = current_author
  end

  def create
    @book = Book.new(book_params)
    @book.author = current_author
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @author = current_author
  end

  def update
    @book.update(book_params)
    @book.author = current_author
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def buy
    @book = Book.find(params[:id])
    @author = @book.author
  end

  def pay
    @book = Book.find(params[:id])
    @user = current_user
    @client = current_client
    @author = @book.author
  end

  def bought
    @book = Book.find(params[:id])
    @user = current_user
  end

  private

  def sort_results(data)
    @books = data
    # data.sort_by { |hash| hash['publication_year'] }.reverse
  end

  def set_book
    @book = Book.find(params[:id])
  end


  def book_params
    params.require(:book).permit(:price, :title, :synopsys, :genre, :cover_pic, :cover_pic_cache, :publisher, :publication_year)
  end

end
