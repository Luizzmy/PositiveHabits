class DailyLogsController < ApplicationController


  def index
    @daily_logs=DailyLog.all
  end

  def new
    @daily_log= DailyLog.new(params[:activity_id])
  end

  def create
    @daily_log=DailyLog.new(daily_params)
    if @daily_log.save
      flash[:notice]="Daily Log added succesfully"
      redirect_to(activities_path)
    else
      render('new')
    end
  end

  def destroy
    @daily_log=DailyLog.find(params[:id])
    @daily_log.destroy
    flash[:notice] ="Log destroyed succesfully"
    redirect_to(activities_path)
  end

  private

  def daily_params
    params.require(:daily_log).permit(:activity_id, :date, :achieved, :comments)
  end


end
