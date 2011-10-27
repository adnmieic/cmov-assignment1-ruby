class DoctorsController < ApplicationController
  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @doctors }
    end
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doctor }
    end
  end

  # GET /doctors/new
  # GET /doctors/new.json
  def new
    @doctor = Doctor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @doctor }
    end
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        update_specialties
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render json: @doctor, status: :created, location: @doctor }
      else
        format.html { render action: "new" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.json
  def update
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
		update_specialties
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url }
      format.json { head :ok }
    end
  end



  def appointments
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
      format.json { render json: @doctor.appointments }
    end
  end

  def specialties
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
      format.json { render json: @doctor.specialties }
    end
  end

  def schedule_plans
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
      format.json { render json: @doctor.schedule_plans }
    end
  end



  protected
  def update_specialties
    @doctor.specialties.clear
    @specialty_ids = params[:specialty_ids]
    
    if @specialty_ids == nil
    	@specialty_ids = params[:doctor][:specialty_ids]
    end
    
    @specialty_ids.each do |id|
      @doctor.specialties.push(Specialty.find(id))
    end
    @doctor.save
  end
end
