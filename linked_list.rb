require_relative 'node'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @tail = Node.new
    @head = Node.new(link: @tail)
  end

  def append(value)
    new_node = Node.new(value)

    @tail.link = new_node unless @tail.nil?

    @tail = new_node
  end

  def prepend(value)
    return append(value) if @tail.nil?

    new_node = Node.new(value)

    new_node.link = @head.link

    @head.link = new_node
  end
end
