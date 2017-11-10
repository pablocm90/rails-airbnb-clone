class AuthorsController < ApplicationController
  before_action :set_author, only: [ :dashboard, :edit, :show ]


  def new
    @author = Author.new()
  end

  def create
    @author = Author.new(author_params)
    @author.user = current_user
    if @author.save
      current_user.is_author = true
      current_user.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
  end

  def dashboard
  end

  def edit
  end

  def update
  end






  private

  def set_author
    @author = current_author
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def author_params
    params.require(:author).permit(:profile_picture, :profile_picture_cache, :description, :currency, :birthday, :active, :book)
  end



end

