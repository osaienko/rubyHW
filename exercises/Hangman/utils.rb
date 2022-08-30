def user_won?(word, correct_letters)
  word.uniq.size == correct_letters.size
end
