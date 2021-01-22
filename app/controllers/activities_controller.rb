class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    @daily_logs = DailyLog.where(:activity_id => params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:notice] ="Activity created succesfully"
      redirect_to(activities_path)
    else
      render('new')
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end
  
  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      flash[:notice] ="Activity updated succesfully"
      redirect_to(activity_path(@activity))
    else
      render('edit')
    end
  end

  def delete
    @activity = Activity.find(params[:id])
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    flash[:notice] ="Activity '#{@activity.name}' destroyed succesfully"
    redirect_to(activities_path)
  end

  private 

  def activity_params
    params.require(:activity).permit(:name, :goal, :units, :frequency)
  end

end
