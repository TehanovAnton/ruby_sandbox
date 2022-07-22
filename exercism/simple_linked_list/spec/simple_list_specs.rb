# frozen_string_literal: true

require_relative '../simple_linked_list'
require_relative '../element'
require 'pry-nav'

RSpec.describe SimpleLinkedList do
  describe '#push' do
    context 'when no elements' do
      let(:list) { SimpleLinkedList.new }

      it 'has not head and tail' do
        expect(list.head).to be_nil
        expect(list.tail).to be_nil
      end
    end

    context 'when push one element' do
      let(:element) { Element.new(1) }
      let(:list) { SimpleLinkedList.new.push(element) }

      it 'return list after any action' do
        expect(list).to be_a(SimpleLinkedList)
      end

      it 'has head that equal tail' do
        expect(list.head).to eq(list.tail)
      end
    end

    context 'when push more then one elements' do
      let(:first_element) { Element.new(1) }
      let(:second_element) { Element.new(2) }
      let(:list) { SimpleLinkedList.new.push(first_element).push(second_element) }

      it 'has correct head and tail' do
        expect(list.tail).to eq(second_element)
        expect(list.head).to eq(first_element)
      end

      it 'has correct next and previous on head and tail' do
        expect(list.head.next).to eq(list.tail)
        expect(list.head.previous).to be_nil

        expect(list.tail.next).to be_nil
        expect(list.tail.previous).to eq(list.head)
      end
    end
  end

  describe '#pop' do
    context 'when no elements' do
      let(:element) { SimpleLinkedList.new.pop }

      it 'pops nil' do
        expect(element).to be_nil
      end
    end

    context 'when one element' do
      let(:element) { Element.new(1) }
      let(:list) { SimpleLinkedList.new.push(element) }
      let!(:poped_element) { list.pop }

      it 'pops element' do
        expect(element).to eq(poped_element)
      end

      it 'has no head and tail' do
        expect(list.head).to be_nil
        expect(list.tail).to be_nil
      end
    end

    context 'when push two element' do
      let(:first_element) { Element.new(1) }
      let(:second_element) { Element.new(1) }
      let(:list) { SimpleLinkedList.new.push(first_element).push(second_element) }
      let!(:poped_element) { list.pop }

      it 'pops element' do
        expect(poped_element).to eq(second_element)
      end

      it 'has correct head and tail' do
        expect(list.head).to eq(list.tail)
      end

      it 'has correct next and previous on head and tail' do
        expect(list.head.next).to be_nil
        expect(list.head.previous).to be_nil
      end
    end
  end

  describe '#to_a' do
    context 'when not empty' do
      let(:list) { SimpleLinkedList.new.push(Element.new(1)).push(Element.new(2)) }

      it 'returns arr' do
        expect(list.to_a).to eq([2, 1])
      end
    end

    context 'when empty' do
      let(:list) { SimpleLinkedList.new }

      it 'returns arr' do
        expect(list.to_a).to eq([])
      end
    end
  end

  describe '#initialize' do
    context 'when simple number' do
      let(:list) { SimpleLinkedList.new(1) }

      it 'returns list' do
        expect(list).to be_a(SimpleLinkedList)
        expect(list.to_a).to eq([1])
      end
    end

    context 'when array' do
      let(:list) { SimpleLinkedList.new([1, 2]) }

      it 'returns list' do
        expect(list).to be_a(SimpleLinkedList)
        expect(list.to_a).to eq([2, 1])
      end
    end
  end

  describe '#reverse' do
    let(:list) { SimpleLinkedList.new(1).push(Element.new(2)) }

    it 'returns list' do
      expect(list.reverse).to be_a(SimpleLinkedList)
      expect(list.reverse.to_a).to eq([1, 2])
    end
  end
end
