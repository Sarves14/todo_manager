class TodosController < ApplicationController
  def index
    Todo.all.to_a.each { |todo| render plain: todo.to_pleasant_string }
  end

  def show
    id = params[:id]
    todo = Todo.find(:id)
    render plain: todo.to_pleasant_string
  end

  def new
    Todo.create!(todo_text: params[:todo_text], due_date: params[:due_date], completed: false)
  end

  def update
    todo = Todo.find(params[:id])
    todo.completed = true
    todo.save
  end
end
