require_relative 'pics.rb'
require_relative 'input_methods.rb'
require_relative 'print_methods.rb'
require_relative 'words.rb'

MAX_ALLOWED_ERRORS = 6
SUCCESS = 'success'

# guessed incorrectly
incorrect_letters = []
# guessed correctly
correct_letters = []

# pass argument when launching, e.g. in my case:
# ruby exercises/Hangman/Hangman.rb peace
# word_to_guess = ARGV[0].split('')
# ^^^ commented in favor of choosing a random word from a sample
word_to_guess = WORDS.sample.split('')

while incorrect_letters.size < MAX_ALLOWED_ERRORS
  print_step(word_to_guess, correct_letters, incorrect_letters)

  break if handle_input(word_to_guess, correct_letters, incorrect_letters) == SUCCESS
end

print_step(word_to_guess, correct_letters, incorrect_letters)
puts "Game over. The word was #{word_to_guess.join('')}"