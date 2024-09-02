def ceasar_cipher(string, shift)
  res = ""
  alphabet = ("a".."z").to_a
  string.each_char do |char|
    i = alphabet.index(char)
    index = i + shift > alphabet.length - 1 ? i + shift - alphabet.length : i + shift
    cipher_letter = alphabet[index]
    res += cipher_letter
  end
  res
end

puts "word to cipher: "
word = gets.chomp
cipher_string = ceasar_cipher(word, 3)
puts "#{word} -> #{cipher_string}"