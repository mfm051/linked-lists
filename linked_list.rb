require_relative 'node'

class LinkedList
  include Enumerable

  def initialize
    @head = Head.new
  end

  def append(value)
    new_node = Node.new(value)

    if @head.link.nil?
      @head.link = new_node
    else
      # needs a #tail method
      # tail.link = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)

    new_node.link = @head.link

    @head.link = new_node
  end

  def each
    current = @head

    until current.link.nil?
      current = current.link

      yield current
    end
  end

  def size
    count
  end
end
