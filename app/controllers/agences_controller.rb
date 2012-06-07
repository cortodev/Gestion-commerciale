class AgencesController < ApplicationController
  respond_to :html, :json
  # GET /agences
  # GET /agences.json
  def index
    respond_with( @agences = Agence.all )
  end

  # GET /agences/1
  # GET /agences/1.json
  def show
    respond_with( @agence = Agence.find(params[:id]) )
  end

  # GET /agences/new
  # GET /agences/new.json
  def new
    respond_with( @agence = Agence.new )
  end

  # GET /agences/1/edit
  def edit
    @agence = Agence.find(params[:id])
  end

  # POST /agences
  # POST /agences.json
  def create
    @agence = Agence.new(params[:agence])

    respond_to do |format|
      if @agence.save
        format.html { redirect_to @agence, notice: 'Agence was successfully created.' }
        format.json { render json: @agence, status: :created, location: @agence }
      else
        format.html { render action: "new" }
        format.json { render json: @agence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agences/1
  # PUT /agences/1.json
  def update
    @agence = Agence.find(params[:id])

    respond_to do |format|
      if @agence.update_attributes(params[:agence])
        format.html { redirect_to @agence, notice: 'Agence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agences/1
  # DELETE /agences/1.json
  def destroy
    @agence = Agence.find(params[:id])
    @agence.destroy

    respond_to do |format|
      format.html { redirect_to agences_url }
      format.json { head :no_content }
    end
  end
end
