class AuthorsController < ApplicationController
  before_action :set_author, only: [ :dashboard, :edit ]


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

  def edit

  end

  def show
    if params[:id]
      @author = Author.find(params[:id])
    else
      @author = current_author
    end
  end

  def dashboard
  end



  def update
    current_author.update(author_params)
    if current_author.save!
      redirect_to authors_path
    else
      render :edit
    end
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

