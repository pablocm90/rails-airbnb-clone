class AuthorsController < ApplicationController
  before_action :set_author, only: [ :dashboard ]


  def new
    @author = Author.new()
  end

  def create
    @author = Author.new(author_params)
    @author.user = current_user
    if @author.save
      current_user.is_author = true
      redirect_to dashboard_path
    else
      raise
      render :new
    end
  end

  def show
    @user = current_user
  end

  def dashboard

  end





  private

  def set_author
    @author = current_author
  end

  def author_params
    params.require(:author).permit(:profile_picture, :profile_picture_cache, :description, :currency, :birthday, :active)
  end


end

