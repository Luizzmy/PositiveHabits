class DailyLogsController < ApplicationController
  def index
  end

  def show
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

  def daily_params
    params.require(:daily_log).permit(:activity_id, :achieved, :comments)
  end
end
