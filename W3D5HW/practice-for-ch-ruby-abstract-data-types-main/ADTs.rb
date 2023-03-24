require "byebug"

class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    @stack << el
  end

  def pop
    # removes one element from the stack
    @stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @stack.last
  end
end

# s = Stack.new
# s.push("jim")
# s.push("bob")
# s.push("karen")
# p s
# p s.peek
# s.pop
# p s

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end

# q = Queue.new
# q.enqueue("jon")
# q.enqueue("cam")
# q.enqueue("peter")
# p q
# p q.dequeue
# p q
# p q.peek

class Map
  def initialize
    @map = []
  end

  def set(key, value)
    @map.each do |kvpair| 
      # debugger
      if kvpair.first == key 
        kvpair[-1] = value 
        return nil
      end
    end
    @map << [key, value]
  end

  def get(key)
    @map.each { |kvpair| return kvpair.last if kvpair.first == key }
    nil
  end

  def delete(key)
    @map.delete_if { |kvpair| kvpair.first == key }
  end

  #Not sure what is being asked; readme asks for #show no args, must be
  #entire map? Implemented.
  def show 
    @map.each { |kvpair| puts "#{kvpair.first}: #{kvpair.last}"}
  end
end

# m = Map.new
# m.set(1, "I'm no. one!")
# m.set(3, "Three's co.")
# m.set(4, "There, four.")
# m.show
# m.set(1, "Top dog down")
# m.show
# p m.get(1)
# m.delete(1)
# p m.get(1)
# m.show