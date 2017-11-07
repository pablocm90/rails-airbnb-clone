class AuthorsController < ApplicationController



  private

  def create_author
    @author = Author.new(user: @user)
    @author.s
