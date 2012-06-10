class ContactClientsController < ApplicationController
  respond_to :html, :json

  def index
    respond_with @contact_clients = ContactClient.all
  end

  def new
    respond_with @contact_client = ContactClient.new
  end

  def create
    @contact_client = ContactClient.new params[:contact_client]
    flash[:notice] = "Contact cree."
    respond_with @contact_client
  end

  def show
    respond_with @contact_client = ContactClient.find(params[:id])
  end

  def edit
    respond_with @contact_client = ContactClient.find(params[:id])
  end

  def destroy
    @contact_client = ContactClient.find params[:id]
    @contact_client.destroy

    respond_to do |format|
      format.html { redirect_to contact_clients_url }
      format.json { head :no_content }
    end
  end
end
