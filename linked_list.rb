require_relative 'node'

class LinkedList
  include Enumerable

  def initialize
    @head = Head.new
  end

  def append(value)
    new_node = Node.new(value)

    return @head.link = new_node if size.zero?

    tail.link = new_node
  end

  def prepend(value)
    new_node = Node.new(value)

    new_node.link = @head.link

    @head.link = new_node
  end

  def size
    count
  end

  def head
    @head.link
  end

  def tail
    return nil if size.zero?

    each
  end

  def at(index)
    each_with_index { |node, i| return node if i == index }

    nil
  end

  def pop
    return @head.link = nil if (0..1).include? size

    second_to_last = each { |node| break node if node.link.link.nil? }
    second_to_last.link = nil
  end

  def contains?(value)
    each { |node| return true if node.value == value }

    false
  end

  def find(value)
    each_with_index { |node, i| return i if node.value == value }

    nil
  end

  def to_s
    result = ''

    each { |node| result += "( #{node.value}: #{node.value.class} ) -> " }

    result + 'nil'
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    new_node = Node.new(value)

    each_with_index do |node, i|
      next unless i == index - 1

      new_node.link = node.link
      node.link = new_node

      return node
    end

    "#{index} out of reach"
  end

  private

  def each
    current = @head

    until current.link.nil?
      yield current.link if block_given?

      current = current.link
    end

    current
  end
end
