class RecordsLocationsController < ApplicationController
  # GET /records_locations
  # GET /records_locations.json
  def index
    @records_locations = RecordsLocations.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records_locations }
    end
  end

  # GET /records_locations/1
  # GET /records_locations/1.json
  def show
    @records_location = RecordsLocations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @records_location }
    end
  end

  # GET /records_locations/new
  # GET /records_locations/new.json
  def new
    @records_location = RecordsLocations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @records_location }
    end
  end

  # GET /records_locations/1/edit
  def edit
    @records_location = RecordsLocations.find(params[:id])
  end

  # POST /records_locations
  # POST /records_locations.json
  def create
    @records_location = RecordsLocations.new(params[:records_location])

    respond_to do |format|
      if @records_location.save
        format.html { redirect_to @records_location, notice: 'Records locations was successfully created.' }
        format.json { render json: @records_location, status: :created, location: @records_location }
      else
        format.html { render action: "new" }
        format.json { render json: @records_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /records_locations/1
  # PUT /records_locations/1.json
  def update
    @records_location = RecordsLocations.find(params[:id])

    respond_to do |format|
      if @records_location.update_attributes(params[:records_location])
        format.html { redirect_to @records_location, notice: 'Records locations was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @records_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records_locations/1
  # DELETE /records_locations/1.json
  def destroy
    @records_location = RecordsLocations.find(params[:id])
    @records_location.destroy

    respond_to do |format|
      format.html { redirect_to records_locations_index_url }
      format.json { head :no_content }
    end
  end
end
