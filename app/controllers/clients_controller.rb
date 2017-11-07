class ClientsController < ApplicationController

  before_action :set_client
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    @client.profile_picture = client_params[:profile_picture]
    @client.description = client_params[:description]
    @client.prefered_genre = client_params[:prefered_genre]
    @client.currency = client_params[:currency]
    @client.birthday = client_params[:birthday]
    if @client.save
      redirect_to client_path(@client)
    else
      render 'show'
    end
  end

  def delete
  end

  private

  def set_client
    @client = Client.find(user = current_user)
  end

  def set_user
    @user = current_user
  end

  def client_params
    params.require(:client).permit(:profile_picture, :description, :prefered_genre, :currency, :birthday)
  end




end
