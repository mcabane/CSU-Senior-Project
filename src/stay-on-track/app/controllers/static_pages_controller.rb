class StaticPagesController < ApplicationController
  def home
    @task = Task.new
    if current_user
      current_user.tasks.where(completed: true).each(&:recur_if_due)
      
      today = Date.today
      
      @tasks = current_user.tasks.order(:deadline_date)
      @overdue_tasks = current_user.tasks.where("deadline_date < ? AND completed = ?", today, false)
      @upcoming_tasks = current_user.tasks.where("deadline_date >= ? AND completed = ?", today, false)
      @completed_tasks = current_user.tasks.where(completed: true)
    else
      @tasks = []
      @overdue_tasks = []
      @upcoming_tasks = []
      @completed_tasks = []
    end
  end


  def settings
    # Add logic later
  end

end
