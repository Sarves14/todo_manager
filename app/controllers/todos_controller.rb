class TodosController < ApplicationController
  def index
    @todo = Todo.where(user_id: current_user.id)
    render "index"
  end

  def create
    new_todo = Todo.new(todo_text: params[:todo_text],
                        due_date: params[:due_date],
                        completed: false,
                        user_id: current_user.id)
    if new_todo.save
      redirect_to todos_path
    else
      flash[:error] = new_todo.errors.full_messages.join(", ")
      redirect_to todos_path
    end
  end

  def update
    todo = Todo.where(user_id: current_user.id).find(params[:id])
    flag = (params[:completed] == true || "on") ? true : false
    todo.completed = flag
    todo.save
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.where(user_id: current_user.id).find(id)
    print todo
    todo.destroy
    redirect_to todos_path
  end
end
