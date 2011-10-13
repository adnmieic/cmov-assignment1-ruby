class ClinicInfosController < ApplicationController
  # GET /clinic_infos
  # GET /clinic_infos.json
  def index
    @clinic_infos = ClinicInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clinic_infos }
    end
  end

  # GET /clinic_infos/1
  # GET /clinic_infos/1.json
  def show
    @clinic_info = ClinicInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clinic_info }
    end
  end

  # GET /clinic_infos/new
  # GET /clinic_infos/new.json
  def new
    @clinic_info = ClinicInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clinic_info }
    end
  end

  # GET /clinic_infos/1/edit
  def edit
    @clinic_info = ClinicInfo.find(params[:id])
  end

  # POST /clinic_infos
  # POST /clinic_infos.json
  def create
    @clinic_info = ClinicInfo.new(params[:clinic_info])

    respond_to do |format|
      if @clinic_info.save
        format.html { redirect_to @clinic_info, notice: 'Clinic info was successfully created.' }
        format.json { render json: @clinic_info, status: :created, location: @clinic_info }
      else
        format.html { render action: "new" }
        format.json { render json: @clinic_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clinic_infos/1
  # PUT /clinic_infos/1.json
  def update
    @clinic_info = ClinicInfo.find(params[:id])

    respond_to do |format|
      if @clinic_info.update_attributes(params[:clinic_info])
        format.html { redirect_to @clinic_info, notice: 'Clinic info was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @clinic_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinic_infos/1
  # DELETE /clinic_infos/1.json
  def destroy
    @clinic_info = ClinicInfo.find(params[:id])
    @clinic_info.destroy

    respond_to do |format|
      format.html { redirect_to clinic_infos_url }
      format.json { head :ok }
    end
  end
end
