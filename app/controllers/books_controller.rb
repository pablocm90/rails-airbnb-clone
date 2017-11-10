class BooksController < ApplicationController

  before_action :set_book, only: [ :show, :edit, :update ]
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    @authors = Author.all
    @author = @book.author
    @genres = ["mystery", "thriller", "erotic", "crime", "fantasy"]
    @books = Book.all

  end



  def show
    @author = @book.author
    average_rating(@book)
    @rating_count = @book.reviews.count
  end

  def search
    @books = Book.all
    @books.reindex
    if params[:query].present?
      @books = Book.search(params[:query])
    else
      @books = Book.all
    end
    sort_results(@books)
  end

  def new
    @book = Book.new
    @author = current_author
  end

  def create
    @book = Book.new(book_params)
    @book.author = current_author
    @book.author_name = current_author.user.username
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
    @books = Book.all
    @book.author = current_author
    if @book.update(book_params)
      redirect_to book_path(@book)
      @books.reindex
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
    BookTransaction.create(book: @book, user: @user)
  end

  private

  def sort_results(data)
    @ordered_books = data.sort_by { |book| average_rating(book) }
    @ordered_books.reverse!
  end

  def set_book
    @book = Book.find(params[:id])
  end


  def book_params
    params.require(:book).permit(:price, :title, :synopsys, :genre, :cover_pic, :cover_pic_cache, :publisher, :publication_year, :author_name)
  end

  def average_rating(book)
    book.reviews.count != 0 ? @average_rating = book.reviews.average(:rating).round(0) : @average_rating = 0
  end

end
