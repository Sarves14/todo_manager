class TodosController < ApplicationController
  def index
    render "index"
    # if Todo.all.length > 0
    #   list = Todo.all.to_a.map { |todo| todo.to_pleasant_string }
    #   render plain: list.join("\n")
    # else
    #   render plain: "No Todos in the database"
    # end
  end

  def show
    id = params[:id]
    todo = Todo.find_by(id: id)
    render plain: (todo == nil ? "No Todo with the given id" : todo.to_pleasant_string)
  end

  def create
    Todo.create!(todo_text: params[:todo_text], due_date: params[:due_date], completed: false)
    redirect_to todos_path
  end

  def update
    todo = Todo.find(params[:id])
    flag = (params[:completed] == true || "on") ? true : false
    todo.completed = flag
    print todo.completed
    todo.save
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
