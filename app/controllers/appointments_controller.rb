class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])
    set_doctor_patient

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])
    set_doctor_patient

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :ok }
    end
  end

  def extract_time(d)
    Time.new(2000, 1, 1, d.hour, d.min, d.sec)
  end

  # GET /appointments/freeslots/2011/10/28
  def freeslots
    date = Date::civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    schedule_plan = SchedulePlan.find(:first, :conditions => ['start <= ? AND (end IS NULL OR end >= ?)', date, date])

    res = []

    if schedule_plan
      appointments = Appointment.find(:all, :conditions => ['DATE(date) = ?', date])
      schedules = Schedule.find(:all, :conditions => ['schedule_plan_id = ? AND weekday = ?', schedule_plan.id, date.wday-1])

      aps = []

      appointments.each do |appointment|
        t = extract_time appointment.date
        aps.push([t, t + appointment.duration * 60])
      end

      schedules.each do |schedule|
        res.push([extract_time(schedule.start), extract_time(schedule.end)])
      end

      aps.each do |ap|
        res.each_index do |i|
          # if the start of a appointment is between a schedule
          if ap[0] >= res[i][0] and ap[0] <= res[i][1]
            new_elm = nil
            if ap[0] > res[i][0]
              new_elm = [ res[i][0], ap[0] ]
            end

            new_elm2 = nil
            if ap[1] < res[i][1]
              new_elm2 = [ ap[1], res[i][1] ]
            end

            if new_elm
              res[i] = new_elm
              if new_elm2
                res.insert i+1, new_elm2
              end
            else
              if new_elm2
                res[i] = new_elm2
              else
                res.delete_at(i)
              end
            end
          end
        end
      end

    end

    respond_to do |format|
      format.json { render json: res }
    end
  end

  protected
  def set_doctor_patient
  	@doctor_id = params[:doctor_id]
  	if @doctor_id == nil
  		@doctor_id = params[:appointment][:doctor_id]
  	end
  	@patient_id = params[:patient_id]
  	if @patient_id == nil
  		@patient_id = params[:appointment][:patient_id]
  	end
    @appointment.doctor = Doctor.find(@doctor_id)
    @appointment.patient = Patient.find(@patient_id)
  end

end
