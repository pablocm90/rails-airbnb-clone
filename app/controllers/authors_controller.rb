class AuthorsController < ApplicationController



  private

  def set_author

  end

  def set_user
    @user = current_user
  end

end
