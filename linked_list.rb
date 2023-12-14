require_relative 'node'
require_relative 'head'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = Head.new
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)

    return @tail = new_node if @tail.nil?
  end

  def prepend(value)
    new_node = Node.new(value)

    return @head.link = new_node if @head.link.nil?

    new_node.link = @head.link

    @head.link = new_node
  end
end
