require 'opal'
require 'jquery'
require 'opal-jquery'      # gives us a nice wrapper on jQuery which we will use mainly for HTTP calls
require 'json'             # json conversions
require 'react-latest'     # you can also load a specific version, such as 'react-v14'
require 'reactrb'          # and the whole reason we are gathered here today!

require 'todo'
require 'todo_store'

require 'components/todo_box'
require 'components/todo_form'
require 'components/todo_element'

$store = ToDoStore.new([])

render = lambda do
  Element['#content'].render { ToDoBox(todos: $store.state) }
end

Document.ready? do
  $store.subscribe(&render)
  render.call
end
