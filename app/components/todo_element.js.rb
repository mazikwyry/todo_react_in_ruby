class ToDoElement < React::Component::Base
  param :todo, type: Object

  render do
    li { params.todo.body }
  end
end
