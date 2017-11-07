class AuthorsController < ApplicationController
  before_action :set_author, only: [ :create ]


  def new
    @author = Author.new()
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path
    else
      render :new
    end
  end




  private

  def set_author
    @author = @current_author
  end

  def author_params
    params.require(:author).permit(:user_id, :profile_picture, :description, :currency, :birthday, :active)
  end


end

