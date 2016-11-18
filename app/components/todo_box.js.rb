class ToDoBox < React::Component::Base
  param :todos, type: Array

  def add_todo(body)
    $store.dispatch({
      type: :add_todo,
      id: 1,
      body: body
    })
  end

  render do
    div do
      h1 { 'Dreams to fulfill' }
      params.todos.each do |todo|
        ToDoElement(todo: todo)
      end
      ToDoForm(add_todo: lambda { |body| add_todo(body) }) #Method Object
    end
  end
end
