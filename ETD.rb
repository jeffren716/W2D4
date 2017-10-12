def my_min(arr)
  arr.each_index do |i|
    counter = 0
    arr.each_index do |j|
      counter +=1 if arr[j] < arr[i]
    end
    return arr[i] if counter == 0
  end
end

# my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

def my_min2(arr)
  smallest = arr.first
  arr.each do |el|
    smallest = el if el < smallest
  end
  smallest
end

def sub_array(arr)
  ans = []
  (0...arr.length-1).each do |starter|
    (starter...arr.length).each do |ender|
      ans << arr[starter..ender]
    end
  end
  ans.map!{|el| el.reduce(:+)}

  ans.max


end

def fast_sub(arr)
  real_max = arr.first
  current_max = arr.first

  arr.each_with_index do |num,idx|

    puts "current idx: #{idx}"



    next if idx == 0

      if num < 0 && (num + current_max) < 0
        current_max = 0
      else
        current_max += num
      end
      real_max = current_max if current_max > real_max
      puts "current num: #{num} current_max: #{current_max} real_max: #{real_max}"

  end
  real_max

  end

  # real_largest = arr.first
  # current_largest = 0
  # arr.each.with_index do |num, i|
  #   if i == 0
  #     next
  #   elsif num > 0 && current_largest > 0
  #     current_largest += num
  #   elsif num > 0 && current_largest < 0
  #     current_largest = num
  #   elsif num < 0 && ( num +  current_largest < 0 )
  #     real_largest = current_largest if current_largest > real_largest
  #     current_largest = num
  #     next
  #   elsif num < 0 && ( num +  current_largest >= 0 )
  #     current_largest += num
  #   end
  #
  # end
  #
