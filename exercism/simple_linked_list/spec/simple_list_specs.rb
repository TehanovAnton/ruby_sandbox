
require_relative '../simple_linked_list.rb'
require_relative '../element.rb'
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

      it 'has head and tail' do
        expect(list.head).to eq(element)
        expect(list.tail).to eq(element)
      end

      it 'has next and has previous as itself on head' do
        expect(list.head.next).to eq(list.tail)
        expect(list.head.previous).to eq(list.head)
      end

      it 'has previous and has next as itself on tail' do
        expect(list.tail.next).to eq(list.tail)
        expect(list.tail.previous).to eq(list.head)
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
        expect(list.head.previous).to eq(list.head)

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
  end
end