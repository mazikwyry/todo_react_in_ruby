class ToDo
  attr_accessor :body, :id

  def initialize(id, body)
    @body = body
    @id = id
  end
end
