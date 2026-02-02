class StaticPagesController < ApplicationController
  def home
    @task = Task.new
    if current_user
      current_user.tasks.where(completed: true).each(&:recur_if_due)
      
      today = Date.today
      
       @tasks = current_user.tasks.order( :deadline_date)

      @overdue_tasks = current_user.tasks.where("deadline_date < ? AND completed = ?", today, false).order(
        Arel.sql("CASE urgency
                WHEN 'high' THEN 1
                WHEN 'medium' THEN 2
                WHEN 'low' THEN 3
              END ASC"),:deadline_date
        )


      @upcoming_tasks = current_user.tasks.where("deadline_date >= ? AND completed = ?", today, false).order(
        Arel.sql("CASE urgency
                WHEN 'high' THEN 1
                WHEN 'medium' THEN 2
                WHEN 'low' THEN 3
              END ASC"),:deadline_date
        )

      @completed_tasks = current_user.tasks.where(completed: true).order(
        Arel.sql("CASE urgency
                WHEN 'high' THEN 1
                WHEN 'medium' THEN 2
                WHEN 'low' THEN 3
              END ASC"),:deadline_date
        )
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
