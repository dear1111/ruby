class TasksController < ApplicationController
  before_action :set_task, only: [ :update, :destroy ]

  def index
    # ดึง task ทั้งหมด โดยถ้า task ไหนไม่มี status ให้ถือเป็น pending
    @tasks = Task.all.order(created_at: :desc)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.status = "pending"
    if @task.save
      redirect_to tasks_path
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    end
  end

  # ลบถาวรออกจาก Database
  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed, :status)
  end
end
