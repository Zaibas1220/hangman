def random_word()
  word_list = []
  english_dictionary = File.read("./5desk.txt")
  english_dictionary.lines.each do |word|
    word.gsub!("\n", "")
    word.gsub!("\r", "")
    if word.to_s.length > 5 && word.to_s.length <= 12
      word_list.push(word)
    end
  end
  length = word_list.length
  length -= 1
  word_list[rand(length)].downcase
end

def parola_casuale()
  word_list = []
  english_dictionary = File.read("./italian_dictionary.txt")
  english_dictionary.lines.each do |word|
    word.gsub!("\n", "")
    word.gsub!("\r", "")
    word.gsub!(" ", "")
    if word.to_s.length > 5 && word.to_s.length <= 12
      word_list.push(word)
    end
  end
  length = word_list.length
  length -= 1
  word_list[rand(length)].downcase
end