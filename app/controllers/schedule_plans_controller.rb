class SchedulePlansController < ApplicationController
  # GET /schedule_plans
  # GET /schedule_plans.json
  def index
    @schedule_plans = SchedulePlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule_plans }
    end
  end

  # GET /schedule_plans/1
  # GET /schedule_plans/1.json
  def show
    @schedule_plan = SchedulePlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule_plan }
    end
  end

  # GET /schedule_plans/new
  # GET /schedule_plans/new.json
  def new
    @schedule_plan = SchedulePlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule_plan }
    end
  end

  # GET /schedule_plans/1/edit
  def edit
    @schedule_plan = SchedulePlan.find(params[:id])
  end

  # POST /schedule_plans
  # POST /schedule_plans.json
  def create
    @schedule_plan = SchedulePlan.new(params[:schedule_plan])

    respond_to do |format|
      if @schedule_plan.save
        format.html { redirect_to @schedule_plan, notice: 'Schedule plan was successfully created.' }
        format.json { render json: @schedule_plan, status: :created, location: @schedule_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedule_plans/1
  # PUT /schedule_plans/1.json
  def update
    @schedule_plan = SchedulePlan.find(params[:id])

    respond_to do |format|
      if @schedule_plan.update_attributes(params[:schedule_plan])
        format.html { redirect_to @schedule_plan, notice: 'Schedule plan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_plans/1
  # DELETE /schedule_plans/1.json
  def destroy
    @schedule_plan = SchedulePlan.find(params[:id])
    @schedule_plan.destroy

    respond_to do |format|
      format.html { redirect_to schedule_plans_url }
      format.json { head :ok }
    end
  end
end
