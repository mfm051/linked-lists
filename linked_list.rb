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
      yield current.link

      current = current.link
    end
  end

  def size
    count
  end

  def head
    @head.link
  end

  def tail
    return nil if size.zero?

    each { |node| return node if node.link.nil? }
  end
end
