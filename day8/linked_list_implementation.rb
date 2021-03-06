# Linked List Implementation
class Node
	attr_accessor :value, :next
	def initialize(value)
		@value = value
		@next = nil
	end

	def get_value
		@value
	end

	def get_next
		@next
	end

	def set_value(value)
		@value = value
	end

	def set_next(next_pointer)
		@next = next_pointer
	end
end

class LinkedList

	def initialize
		@head = nil
		@length = 0
	end

	def length
		@length
	end

	def explain
		element = @head
		loop do
			break if element.nil?
			p [element.get_value, element.get_next]
			element = element.get_next
		end
	end

	def insert(data)
		@length += 1
		if @head.nil?
			node = Node.new(data)
			@head = node
		else
			element = @head
			while(element.get_next != nil)
				element = element.get_next
			end
			node = Node.new(data)
			element.set_next(node)
		end
	end

	def insertAt(pos, data)
		return nil if pos > length+1 || pos <= 0

		if pos == 1
			node = Node.new(data)
			temp = @head
			@head = node
			node.set_next(temp)
			@length += 1
			return
		end

		element = @head
		prev_element = nil
		iterate_pos = 1
		while(element.get_next != nil)
			break if iterate_pos == pos
			iterate_pos += 1
			prev_element = element
			element = element.get_next
		end

		temp = element
		if pos == length+1
			temp = nil
			prev_element = element
		end

		node = Node.new(data)
		prev_element.set_next(node)
		node.set_next(temp)
		@length += 1
	end

	def remove(pos = nil)
		if pos.nil?
			element = @head
			prev_element = nil
			while(element.get_next != nil)
				prev_element = element
				element = element.get_next
			end
			prev_element.set_next(nil)
			@length -= 1
		else
			return nil if pos > length || pos <= 0

			element = @head

			if pos == 1
				@head = element.get_next
				@length -= 1
				return
			end

			prev_element = nil
			iterate_pos = 1
			while(element.get_next != nil)
				break if iterate_pos == pos
				iterate_pos += 1
				prev_element = element
				element = element.get_next
			end

			if pos == length
				prev_element.set_next(nil)
			else
				prev_element.set_next(element.get_next)
				element.set_next(nil)
			end
			@length -= 1
		end
	end
end


list = LinkedList.new
list.insert(10)
list.insert(20)
list.insert(30)
list.insertAt(4, 40)
list.remove(1)
list.explain
p list.length