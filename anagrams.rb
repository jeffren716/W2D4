require 'benchmark'

class String
  def first_anagram?(second_string)
    arr = self.chars
    perm = arr.permutation.to_a
    perm.map!{|arr| arr.join("")}
    perm.include?(second_string)
  end


  #this one is n^2
  def second_anagram?(second_string)
      arr1 = self.chars
    arr2 = second_string.chars
    arr1.each_with_index do |let1,idx1|
      arr2.each_with_index do |let2,idx2|
        if let1 == let2
          arr1[idx1] = nil
          arr2[idx2] = nil
        end
      end
    end
    return true if arr1.compact.empty? && arr2.compact.empty?
    false
  end

  #this one depends on what sorting method is used...
  #n log n
  def third_anagram?(second_string)
    self.chars.sort == second_string.chars.sort
  end

  def fourth_anagram?(second_string)
    # hash1 = Hash.new(0)
    # hash2 = Hash.new(0)
    # self.chars.each do |char|
    #   hash1[char]+=1
    # end
    # second_string.chars.each do |char|
    #   hash2[char]+=1
    # end
    #
    # return hash1 == hash2

    hash = Hash.new(0)
    self.chars.each do |char|
      hash[char]+=1
    end
    second_string.chars.each do |char|
      hash[char]-=1
    end

    hash.values.all?{|el| el == 0}



  end

end

def quicksort(arr1)
  return arr1 if arr1.length <= 0
  pivot = arr1.first
  left = []
  right = []
  arr1[1..-1].each do |el|
    left << el if el <= pivot
    right <<el if el > pivot
  end

  return left.quicksort + [pivot]+ right.quicksort

end
