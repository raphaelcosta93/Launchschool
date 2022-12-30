=begin
create  a class named LinkedList , this class is supposed to track a list of elements, these elements are 
objects created by this class


craete a collaborator class anmed SimpleLinkedLists


end
create a class variable named elements

create a constructor that takes one number as parameter and a secondary optional argument that is se
  initialize a instace variable with that number
  and add the number to the class variable elements.
end


create a instance method



end

=end



class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum =  datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def size
    size = 0
    current_elem = @head
    while (current_elem)
      size += 1
      current_elem = current_elem.next
    end
    size  end

  def empty?
    @head.nil?
  end

  def push(datum)
    element = Element.new(datum, @head)
    @head = element
  end

  def peek
    @head.datum if @head
  end

  def head
    @head if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end

  def to_a
    array = []
    current_elem = head
    while !current_elem.nil?
      array.push(current_elem.datum)
      current_elem = current_elem.next
    end
    array
  end

  def reverse
    list = SimpleLinkedList.new
    current_elem = head
    while !current_elem.nil?
      list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    list
  end

end
