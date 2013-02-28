class RecordsDescriptionsController < ApplicationController
  # GET /records_descriptions
  # GET /records_descriptions.json
  def index
    @records_descriptions = RecordsDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records_descriptions }
    end
  end

  # GET /records_descriptions/1
  # GET /records_descriptions/1.json
  def show
    @records_description = RecordsDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @records_description }
    end
  end

  # GET /records_descriptions/new
  # GET /records_descriptions/new.json
  def new
    @records_description = RecordsDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @records_description }
    end
  end

  # GET /records_descriptions/1/edit
  def edit
    @records_description = RecordsDescription.find(params[:id])
  end

  # POST /records_descriptions
  # POST /records_descriptions.json
  def create
    @records_description = RecordsDescription.new(params[:records_description])

    respond_to do |format|
      if @records_description.save
        format.html { redirect_to @records_description, notice: 'Records description was successfully created.' }
        format.json { render json: @records_description, status: :created, location: @records_description }
      else
        format.html { render action: "new" }
        format.json { render json: @records_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /records_descriptions/1
  # PUT /records_descriptions/1.json
  def update
    @records_description = RecordsDescription.find(params[:id])

    respond_to do |format|
      if @records_description.update_attributes(params[:records_description])
        format.html { redirect_to @records_description, notice: 'Records description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @records_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records_descriptions/1
  # DELETE /records_descriptions/1.json
  def destroy
    @records_description = RecordsDescription.find(params[:id])
    @records_description.destroy

    respond_to do |format|
      format.html { redirect_to records_descriptions_url }
      format.json { head :no_content }
    end
  end
end
