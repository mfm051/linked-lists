# frozen_string_literal: true

# Nodes inside a linked list
class Node
  attr_reader :value
  attr_accessor :link

  def initialize(value = nil, link: nil)
    @value = value
    @link = link
  end
end
