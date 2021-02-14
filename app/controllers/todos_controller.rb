class TodosController < ApplicationController
  def index
    render plain: Todo.all.to_a
  end

  def show
    id = params[:id]
    todo = Todo.find(:id)
    render plain: todo.to_pleasant_string
  end

  def new
    Todo.create!(todo_text: params[:todo_text], due_date: params[:due_date], completed: false)
  end
end
