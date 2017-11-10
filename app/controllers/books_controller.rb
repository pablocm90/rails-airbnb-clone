class BooksController < ApplicationController

  before_action :set_book, only: [ :show, :edit, :update ]
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    @authors = Author.all
    @author = @book.author
    @genres = ["mystery", "thriller", "erotic", "crime", "fantasy"]
    @books = Book.all
    sort_results
  end

  def show
    @author = @book.author
    reviews = Review.where(book_id: @book.id)
    sum = 0
    i = 0
    reviews.each do |review|
      rating = review.rating
      sum += rating
      i += 1
    end
    @average_rating = (i == 0) ? "No reviews yet" : (sum / i)
  end

  def search
    @author = @book.author
    @books = Book.all
    @books.reindex
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
    @books = data
    # to do: sort by something (year, rating, whatevvah)
  end

  def set_book
    @book = Book.find(params[:id])
  end


  def book_params
    params.require(:book).permit(:price, :title, :synopsys, :genre, :cover_pic, :cover_pic_cache, :publisher, :publication_year, :author_name)
  end

end
