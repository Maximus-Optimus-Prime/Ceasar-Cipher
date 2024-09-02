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

puts "word to cipher: "
word = gets.chomp
puts "shift number: "
shift = gets.chomp
cipher_string = ceasar_cipher(word, shift.to_i)
puts "#{word} -> #{cipher_string}"