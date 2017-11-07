class ClientsController < ApplicationController

  before_action :set_client, except: [:update]
  before_action :set_user, except: [:update]

  def show
  end

  def edit
  end

  def update
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

  end




end
