class EducationRecordsController < ApplicationController
  # GET /education_records
  # GET /education_records.json
  def index
    @education_records = EducationRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @education_records }
    end
  end

  # GET /education_records/1
  # GET /education_records/1.json
  def show
    @education_record = EducationRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @education_record }
    end
  end

  # GET /education_records/new
  # GET /education_records/new.json
  def new
    @education_record = EducationRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @education_record }
    end
  end

  # GET /education_records/1/edit
  def edit
    @education_record = EducationRecord.find(params[:id])
  end

  # POST /education_records
  # POST /education_records.json
  def create
    @education_record = EducationRecord.new(params[:education_record])

    respond_to do |format|
      if @education_record.save
        format.html { redirect_to @education_record, notice: 'Education record was successfully created.' }
        format.json { render json: @education_record, status: :created, location: @education_record }
      else
        format.html { render action: "new" }
        format.json { render json: @education_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /education_records/1
  # PUT /education_records/1.json
  def update
    @education_record = EducationRecord.find(params[:id])

    respond_to do |format|
      if @education_record.update_attributes(params[:education_record])
        format.html { redirect_to @education_record, notice: 'Education record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @education_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /education_records/1
  # DELETE /education_records/1.json
  def destroy
    @education_record = EducationRecord.find(params[:id])
    @education_record.destroy

    respond_to do |format|
      format.html { redirect_to education_records_url }
      format.json { head :no_content }
    end
  end
end
