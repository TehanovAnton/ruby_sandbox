# frozen_string_literal: true

require_relative 'element'

class SimpleLinkedList
  attr_reader :head, :tail, :datum

  def initialize
    @head = nil
    @tail = nil
  end

  def push(element)
    update(element, action: method(:add_element))
  end

  def pop
    update(action: method(:remove_last_element), action_result: true)
  end

  private

  def remove_last_element
    return if empty?

    removed_element = head
    if one?
      @head = @tail = nil
    else
      removed_element = (@tail = @tail.previous).next
      @tail.next = nil
    end

    removed_element
  end

  def empty?
    head.nil?
  end

  def one?
    tail == head
  end

  def add_element(element)
    return primary_setup(element) if first?

    update_tail(element)
  end

  def first?
    head.nil?
  end

  def primary_setup(element)
    @head = @tail = element
  end

  def update_tail(element)
    # binding.pry
    element.previous = tail
    @tail.next = element
    @tail = element
  end

  def update(*params, action:, action_result: false)
    result = action.call(*params)
    return result if action_result

    self
  end
end
