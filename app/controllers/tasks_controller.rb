class TasksController < ApplicationController

  def index
    @tasks = Task.new
  end

  def create
    @task = Task.new(task_paramss)
    if @task.save
      flash[:notice]= "You task has been saved succesfully"
      redirect_to user_path
    else
      flash[:notice]= "You entered invalid input, try again"
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date)
  end
end

