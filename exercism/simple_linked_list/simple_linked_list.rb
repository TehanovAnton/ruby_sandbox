# frozen_string_literal: true

require_relative 'element'

module SimpleLinkedListBase
  def update(*params, action:, action_result: false)
    result = action.call(*params)
    return result if action_result

    self
  end

  def empty?
    head.nil?
  end
end

module SimpleLinkedListPopFunctionality
  include SimpleLinkedListBase

  def pop
    update(action: method(:remove_last_element), action_result: true)
  end

  def remove_last_element
    return if empty?

    removed_element = head
    if one?
      @head = @tail = nil
    else
      removed_element = (@tail = @tail.previous).next_el
      @tail.next_el = nil
    end

    removed_element
  end

  def one?
    tail == head
  end
end

module SimpleLinkedListPushFunctionality
  include SimpleLinkedListBase

  def push(element)
    update(element, action: method(:add_element))
  end

  def first?
    head.nil?
  end

  def update_tail(element)
    # binding.pry
    element.previous = tail
    @tail.next_el = element
    @tail = element
  end

  def primary_setup(element)
    @head = @tail = element
  end

  def add_element(element)
    return primary_setup(element) if first?

    update_tail(element)
  end
end

module SimpleLinkedListEnumerableFunctionality
  include Enumerable

  def each(&block)
    return if empty?

    head.each(&block)
  end
end

module SimpleLinkedListToArrFunctionality
  include SimpleLinkedListEnumerableFunctionality

  def to_a
    return [] if empty?

    head.reverse_each.with_object([]) { |element, memo| memo << element.datum }
  end
end

class SimpleLinkedList
  attr_reader :head, :tail

  include SimpleLinkedListPushFunctionality
  include SimpleLinkedListPopFunctionality
  include SimpleLinkedListToArrFunctionality

  def initialize(datums = [])
    @head = nil
    @tail = nil
    datums = ([] << datums).flatten

    datums.each { |datum| push(Element.new(datum)) }
  end
end
