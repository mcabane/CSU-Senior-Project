class TasksController < ApplicationController
    def new
    @task = Task.new
    end

   def create
        @task = current_user.tasks.create(task_params)
  if @task.save
    redirect_to root_path, notice: "Task created successfully!"
  else
    render :new, alert: "Task creation failed."
   end

    end

    def index
       @tasks = current_user.tasks.order(:deadline_date)
    end
        
    def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
        redirect_to root_path, notice: "Task updated!"
    else
        redirect_to root_path, alert: "Update failed."
    end
    end

    def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to root_path, notice: "Task deleted successfully."
    end

    
    private

    def task_params
    params.require(:task).permit(:title, :description, :deadline_date, :recurrence, :urgency, :deadline_type, :category, :completed)
    end

end
