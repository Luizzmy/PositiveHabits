class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(subject_params)
    if @activity.save
      redirect_to(activities_path)
    else
      render('new')
    end
  end

  def edit
  end
  
  def update
  end

  def delete
  end

  def destroy
  end

  private 

  def subject_params
    params.require(:activity).permit(:name, :goal, :units, :frequency)
  end

end
