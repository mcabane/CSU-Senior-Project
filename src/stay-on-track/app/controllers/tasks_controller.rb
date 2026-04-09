class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    
    if @task.recurrence == "Custom"
      @task.recurrence = params[:task][:custom_recurrence]
    end

    if @task.category == "Custom"
      @task.category = params[:task][:custom_category]
    end

    if @task.recurrence == "weekdays"
      weekdays = params[:task][:weekday_recurrence] || []
      @task.weekday_recurrence = weekdays.join(",")
    end


    if @task.save
      redirect_to root_path, notice: "Task created successfully!"
    else
      render :new, status: :unprocessable_entity, alert: "Task creation failed."
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
  
  def delete_category
    category = params[:category]
    current_user.tasks.where(category: category).update_all(category: nil)
    redirect_to new_task_path, notice: "Category deleted"
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
    params.require(:task).permit(
      :title, :description, :deadline_date, :recurrence, 
      :urgency, :deadline_type, :category, :completed, 
      :custom_category, :custom_recurrence_number, :custom_recurrence_unit, 
      :weekday_recurrence)
  end

end
