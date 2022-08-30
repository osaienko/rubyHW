require_relative 'utils.rb'

def print_word(word, correct_letters)
  result =''
  word.each do |letter|
    if correct_letters.include?(letter)
      result << "#{letter}"
    else
      result << '_'
    end
  end
  result
end

def print_hangman(incorrect_letters)
  puts HANGMAN_PICS[incorrect_letters.size]
end

def print_step(word, correct_letters, incorrect_letters)
  print_hangman(incorrect_letters)
  puts print_word(word, correct_letters)
  puts "Errors #{incorrect_letters.size}: #{incorrect_letters.join(', ')}"
  puts "You win!" if user_won?(word, correct_letters)
end
