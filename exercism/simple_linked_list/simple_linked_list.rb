require_relative 'element'

class SimpleLinkedList
  attr_reader :head, :tail, :arr

  def initialize
    @head = nil
    @tail = nil
  end

  def push(element)
    return primary_setup(element) if first?

    update_tail(element)
  end

  def pop
    @tail = @tail.previous
    @tail.next = nil
  end

  private

  def first?
    head.nill?
  end

  def primary_setup(element)
    @head = element
    @tail = element
    
    @head.next = tail
    @tail.previous = head
  end

  def udpate_tail(element)
    element.previous = tail
    @tail.next = element
    @tail = element
  end
end