class ToDoStore
  attr_reader :state

  def initialize(initial_state = nil)
    @state     = initial_state
    @listeners = []
    dispatch({})
  end

  def dispatch(action)
    @state = reducer(@state, action)
    @listeners.each(&:call)
  end

  def subscribe(&listener)
    @listeners << listener
    -> { @listeners.delete(listener) }
  end

  def reducer(state, action)
    case action[:type]
    when :add_todo
      state.push(
        ToDo.new(action[:id], action[:body])
      )
    else
      state
    end
  end
end
