class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :progress

  def index
    @todos = current_user.todos
  end

  def show
    @todo = Todo.find(params[:id])
    @todos = Todo.where(task: @todo.task, completed: true)
  end

  def update
    todo = Todo.find(params[:id])
    todo.completed = !todo.completed
    todo.save
    redirect_to todos_path
  end

  private

  def progress
    @todos_count = current_user.todos.where(completed: true).count
    @task_count = Task.all.count
  end

end
