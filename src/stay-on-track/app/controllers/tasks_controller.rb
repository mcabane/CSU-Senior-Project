class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.create(task_params)
    
    if @task.recurrence == "Custom"
      @task.recurrence = params[:task][:custom_recurrence]
    end

    if @task.category == "Custom"
      @task.category = params[:task][:custom_category]
    end

    if @task.save
      redirect_to root_path, notice: "Task created successfully!"
    else
      render :new, alert: "Task creation failed."
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    attrs = task_params.to_h
    attrs[:completed_at] = Time.current if attrs["completed"] == "true"
    if @task.update(attrs)
        redirect_to root_path, notice: "Task updated!"
    else
        redirect_to root_path, alert: "Update failed."
    end
  end

  def destroy
    if current_user
      @task = current_user.tasks.find(params[:id])
      @task.destroy
      redirect_to root_path, notice: "Task deleted successfully."
    else
      redirect_to root_path, alert: "You must be logged in to delete tasks."
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :deadline_date, :recurrence, :urgency, :deadline_type, :category, :completed, :custom_category, :custom_recurrence_number, :custom_recurrence_unit)
  end

end
