
require 'pry'

class LinkedList

  attr_reader :linked_node

  def initialize(head_node, linked_node = nil, tail_node = nil)
    @head_node = head_node
    @linked_node = linked_node
    @tail_node = tail_node
  end

  def << (element)
    if @linked_node.nil? && @tail_node.nil?
      node = LinkedList.new(element)
      @linked_node = node
      @tail_node = node
    else
      change_tail_node(element)
    end

    self
  end

  def inspect
    [@head_node, @linked_node].inspect
  end

  def each(&block)
    block.call(@head_node)
    @linked_node.each(&block) if @linked_node
  end

  private

  def change_tail_node(element)
    @tail_node << element
    @tail_node = @tail_node.linked_node
  end
end

linked_list = LinkedList.new(1) << 2 << 3
p linked_list.inspect
