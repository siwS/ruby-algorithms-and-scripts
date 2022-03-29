# Given an array of integers that is already sorted in ascending order,
# find two numbers such that they add up to a specific target number.
# The function twoSum should return indices of the two numbers such that
# they add up to the target, where index1 must be less than index2.
# Assumptions:
# Answers (both index1 and index2) are not zero-based.
# Each input would have exactly one solution and you may not use the same element twice.
#

def two_sum(integers, target)
  occurrences = {}
  integers.each_with_index do |int, index|
    pair = target - int

    if occurrences.key?(pair)
      return [occurrences[pair], index]
    else
      occurrences[int] = index
    end
  end

  nil
end

puts two_sum([1,2,7,11,15], 16).to_s