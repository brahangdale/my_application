class AddCompleteToTodo < ActiveRecord::Migration
  def change
  	add_column :todos, :complete, :boolean, default: false
  end
end
