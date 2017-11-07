class AuthorsController < ApplicationController
  before_action :set_author, only: [ :dashboard ]


  def new
    @author = Author.new()
  end

  def create
    @author = Author.new(author_params)
    @author.user = current_user
    if @author.save
      current_user.author = true
      redirect_to dashboard_path
    else
      raise
      render :new
    end
  end

  def dashboard

  end





  private

  def set_author
    @author = @current_author
  end

  def author_params
    params.require(:author).permit(:profile_picture, :description, :currency, :birthday, :active)
  end


end

