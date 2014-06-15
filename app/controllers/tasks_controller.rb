class TasksController < ApplicationController

  # def index
  #   @tasks = Task.all
  # end
  def create

    @user = User.find(params[:user_id])
    @task = @user.tasks.build(task_params)
    if @task.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice]= "You entered invalid input, try again"
      render :'users/show'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date)
  end
end

