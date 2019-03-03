class  TodosController  < ApplicationController
	before_action :authenticate_user!
	def index
		if user_signed_in?
			@todos = current_user.todos.order("complete ASC, created_at DESC")
		end
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		@todo.user_id = current_user.id
		if @todo.save
		flash[:notice] = "create"
		redirect_to  todos_path
		else
			render 'index'
		end
	end

	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
		flash[:notice] = "deleted"
		redirect_to  todos_path
	end

	def complete
 		todo = Todo.find(params[:id])
 		todo.complete!
 		flash[:notice] = "complete"
 		redirect_to todos_path
	end

	private
		def todo_params
			params.require(:todo).permit(:title, :user_id)
		end
end