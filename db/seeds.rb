File.open('db/dictionary.txt').each_line do |line|
  
  Anagram.create(
    :word => line.strip,
    :sorted_word => line.strip.downcase.split('').sort.join)
end
