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

### MAIN ###

test_substrings