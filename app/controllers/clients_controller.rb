class ClientsController < ApplicationController

  before_action :set_client, except: [:update]

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
    @client = Client.find(client.user = current_user)
  end



end
