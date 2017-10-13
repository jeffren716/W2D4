


def naive_solution(array,range)
  current_max_range = nil

  array.each_cons(range).to_a.each do |sub_array|
    this_range = sub_array.max - sub_array.min
    current_max_range = this_range if current_max_range.nil? || this_range > current_max_range
    end

    return current_max_range

end

#[1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8

a = [1, 0, 2, 5, 4, 8]
b = 3

p naive_solution(a,b)

#STACK QUEUE EXERCISES

class MyQueue
  def initialize
    @in = MyStack.new
    @out = MyStack.new
  end

  def enqueue(el)
    @in.push(el)
  end

  def dequeue
    if @out.empty?
      @in.size.times do
        @out.push(@in.pop)
      end
    end
    @out.pop
  end

  def peek
    @out.peek
  end

  def size
    @in.size + @out.size
  end

  def empty?
    @in.empty?
  end
end

class MyStack
  def initialize
    @store = []
    @maximum = []
    @minimum = []
    @max_range_seen = nil
  end

  def push(el)
    max(el)
    min(el)
    @store << el
  end

  def pop
    #before we pop the last element, we look at it
    @maximum.delete(peek)
    @minimum.delete(peek)

    @store.pop
  end

  def update_range
    current_range = @maximum - @minimum
    @max_range_seen = current_range if current_range > @max_range_seen

  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max(el)
    @maximum << el if @maximum.empty? || @maximum.last < el
    @maximum.last
  end

  def min(el)
    @minimum << el if @minimum.empty? || @minimum.last > el
    @minimum.last
  end

end
