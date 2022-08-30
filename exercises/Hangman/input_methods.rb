require_relative 'utils.rb'

def user_input
  letter = ''
  while letter.empty?
    letter = STDIN.gets.chomp
  end
  letter
end

def handle_input( word, correct_letters, incorrect_letters)
  input = user_input
  return if correct_letters.include?(input) || incorrect_letters.include?(input)

  if word.include?(input)
    correct_letters << input
    return SUCCESS if user_won?(word, correct_letters)
  else
    incorrect_letters << input
  end
end