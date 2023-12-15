class Node
  attr_reader :value
  attr_accessor :link

  def initialize(value = nil, link: nil)
    @value = value
    @link = link
  end
end

class Head < Node
  def initialize(link = nil)
    super(nil, link: link)
  end
end
