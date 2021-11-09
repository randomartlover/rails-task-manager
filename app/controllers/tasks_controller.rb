class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @new_task = Task.new({ title: params[:task][:title], details: params[:task][:details] })
    @new_task.save
    redirect_to task_path(@new_task)
  end
end
