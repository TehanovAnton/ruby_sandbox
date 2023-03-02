require_relative './element.rb'
require 'pry'

class SimpleLinkedList
  def initialize(elements = nil)
    @start_element = nil
    @end_element = nil

    create_from_array(elements) if elements
  end

  def push(element)
    if @start_element.nil?
      @start_element = element
    else
      @end_element.next = element
    end

    @end_element = element
    return self
  end

  def pop
    if @start_element.nil?
      return nil
    elsif @start_element.next.nil?
      end_element = @end_element
      @start_element = nil
      @end_element = nil
      return end_element
    end

    el = @start_element

    while el.next != @end_element
      el = el.next
    end

    end_element = @end_element
    @end_element = el
    @end_element.next = nil
    return end_element
  end

  def to_a
    return [] unless @start_element
    
    arr = []
    el = @start_element
    while el != @end_element # funny to remake with block
      unshift_to_arr(arr, el.datum)
      el = el.next
    end

    unshift_to_arr(arr, el.datum)
    return arr
  end

  def reverse!
    return self unless @start_element

    arr = []
    while @start_element.next
      pop_to_arr(arr)
    end

    pop_to_arr(arr)
    each_do(arr) { |el| push(el) }
    return self
  end

  private

  def pop_to_arr(arr)
    arr.push(pop)
  end

  def unshift_to_arr(arr, el)
    arr.unshift(el)
  end

  def create_from_array(elements)
    each_do(elements) { |el| push(Element.new(el)) }
  end

  def each_do(elements, &block)
    elements.each(&block)
  end
end

list = SimpleLinkedList.new([1,2,3])
# el = Element.new(1)
# el_1 = Element.new(2)
# el_2 = Element.new(3)
# list.push(el).push(el_1).push(el_2)

p "#{list.reverse!.to_a}"
