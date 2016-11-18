class ToDoForm < React::Component::Base
  param :add_todo, type: Proc

  define_state body: ''

  render do
    div do
      div do
        input(type: :text, value: state.body)
          .on(:change) { |e| state.body! e.target.value }
      end
      button { 'Add' }
        .on(:click) { params.add_todo(state.body) }
    end
  end
end
