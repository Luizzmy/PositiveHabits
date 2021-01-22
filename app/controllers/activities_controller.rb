class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :getuser, :only=>[:create]

  def index
    @activities = Activity.where(:user_id=>current_user.id)
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
    @activity.assign_attributes({:user_id => current_user.id})
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

  def getuser
    @user=request.session_options[:id]
  end

  def activity_params
    params.require(:activity).permit(:user_id, :name, :goal, :units, :frequency)
  end

end
