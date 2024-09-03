def ceasar_cipher(string, shift)
  res = ""
  alphabet = ("a".."z").to_a
  string.each_char do |char|
    uc = char == char.upcase
    if alphabet.include?(char.downcase)
      i = alphabet.index(char.downcase)
      index = i + shift > alphabet.length - 1 ? i + shift - alphabet.length : i + shift
      cipher_letter = alphabet[index]
    else
      cipher_letter = char
    end
    res += uc ? cipher_letter.upcase : cipher_letter
  end
  res
end

def substrings(string, array)
  res = Hash.new(0)
  array.each do |word|
    string.split.each do |string_split|
      if string_split.downcase.include?(word.downcase)
        res[word.downcase] += 1
      end
    end
  end
  res
end

def stock_picker(array)
  day_max = 0
  day_min = 0
  profit = 0
  array.each_with_index do |value, index|
    max, day_max_local = array[index..-1].each_with_index.max_by {|value, index| value}
    if (max - value > profit)
      day_min, day_max = [index, day_max_local + index]
      profit = max - value
    end
  end
  return [day_min, day_max]
end

### TEST ###

def test_ceasar_cipher
  puts "word to cipher: "
  word = gets.chomp
  puts "shift number: "
  shift = gets.chomp
  cipher_string = ceasar_cipher(word, shift.to_i)
  puts "#{word} -> #{cipher_string}"
end

def test_substrings
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  print dictionary
  puts
  string = "Howdy partner, sit down! How's it going?"
  puts string
  puts substrings(string, dictionary)
end

def test_stock_picker
  array = [17,3,6,9,15,8,6,1,10]
  print array; puts
  print stock_picker(array); puts
end

### MAIN ###

test_stock_picker
