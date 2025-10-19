class StaticPagesController < ApplicationController
  def home
      @task = Task.new
      @tasks = Task.all.order(:deadline_date)

  end

  def settings
    # Add logic later
  end

  def login
  end
end
