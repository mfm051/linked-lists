# frozen_string_literal: true

require_relative 'node'

# Linked list implementation
class LinkedList
  include Enumerable

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      each { |node| break node.link = new_node if node.link.nil? }
    end

    to_s
  end

  def prepend(value)
    return append(value) if @head.nil?

    new_node = Node.new(value, link: @head)

    @head = new_node

    to_s
  end

  def size
    count
  end

  def head
    @head.value
  end

  def tail
    return nil if @head.nil?

    each { |node| return node.value if node.link.nil? }
  end

  def at(index)
    each_with_index { |node, i| return node.value if i == index }

    nil
  end

  def pop
    return nil if @head.nil?

    each do |node|
      return @head = nil if @head.link.nil?

      next unless node.link.link.nil?

      break node.link = nil
    end

    to_s
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

    each do |node|
      result += "( #{node.value}: #{node.value.class} ) -> "

      result += 'nil' if node.link.nil?
    end

    result
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    new_node = Node.new(value)

    each_with_index do |node, i|
      next unless i == index - 1

      new_node.link = node.link
      node.link = new_node

      return to_s
    end

    raise ArgumentError, 'index out of reach'
  end

  def remove_at(index)
    before_node = @head

    each_with_index do |node, i|
      next before_node = node if i < index

      @head = @head.link if before_node == node

      before_node.link = node.link

      return node.value
    end

    nil
  end

  private

  def each
    current = @head

    until current.nil?
      yield current

      current = current.link
    end
  end
end
