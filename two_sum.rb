def bad_two_sum?(arr,target)
  arr.each_with_index do |el1,idx1|
    arr.each_with_index do |el2, idx2|
      return true if (el1 + el2 == target && idx1 != idx2)
    end
  end
  return false
end

#array is sorted right now
def logic(arr, target)
  arr.sort!
  return false if arr.length == 1
  return true if arr.first + arr.last == target

  if arr.first + arr.last > target
    logic(arr[0...-1],target)
  elsif arr.first + arr.last < target
    logic(arr[1..-1],target)
  end

end

def okay_two_sum?(arr, target)
  arr.sort!
  logic(arr, target)
end

def best_two_sum?(arr, target)
  hash = Hash.new(0)
  arr.each do |num|
    return true if hash.keys.include?(target - num)
    hash[num] += 1
  end

  false
end
