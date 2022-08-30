# Count how many times each word is encountered in text.

text = 'this text contains exactly three apple words. Apple and apple.'

def count_words(string)
  words_arr = string.split(' ')

  result = Hash.new(0)

   words_arr.each do |word|
     # for this very specific case 'remove' only the . and ,
     word.gsub!(/[!.,]/,'')
     result[word.chomp.downcase] +=1
   end

  result
end

p count_words text

another_text = <<TEXT
In publishing and graphic design,
Lorem ipsum is a placeholder text commonly used to 
demonstrate the visual form of a document or a typeface 
without relying on meaningful content. Lorem ipsum may be used 
as a placeholder before final copy is available.
TEXT

p count_words another_text