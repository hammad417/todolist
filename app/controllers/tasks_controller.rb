class TasksController < ApplicationController
  before_action :set_list, only: [:create, :state, ]
  before_action :set_task, only: [:show, :edit, :update, :destroy, :state]

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @list.tasks.new(task_params)

    @task.save
  end

  def state
    if @task.pending?
      @task.completed!
    else
      @task.pending!
    end
    @task.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @list.tasks.where(id: params[:id]).first
    end

    def set_list
      @list = current_user.lists.where(id: params[:list_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:body, :list_id, :state_cd)
    end
end
