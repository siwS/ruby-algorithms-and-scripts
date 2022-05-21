require 'set'

# Calculates the longest substring with no repetitive characters
def longest_substring(array)
  current_substring = Set.new
  longest_substring = 0
  current_start = 0
  index = 0

  chars = array.chars

  while index < chars.length
    char = chars[index]

    if current_substring.include?(char)
      longest_substring = [longest_substring, current_substring.size].max
      current_substring = Set.new
      index = current_start + 1
      current_start = index
    else
      current_substring.add(chars[index])
      index += 1
    end
  end

  [longest_substring, current_substring.size].max
end

puts longest_substring("dvdf")