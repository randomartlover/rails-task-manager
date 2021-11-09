class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @new_task = Task.new({ title: params[:task][:title], details: params[:task][:details] })
    @new_task.save
    redirect_to task_path(@new_task)
  end

  def edit; end

  def update
    @task.update(title: params[:task][:title], details: params[:task][:details], completed: params[:task][:completed])
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  # def restaurant_params
  #   params.require(:restaurant).permit(:name, :address, :rating)
  # end

  def find_task
    @task = Task.find(params[:id])
  end
end
