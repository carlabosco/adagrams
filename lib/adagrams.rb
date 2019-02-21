LETTERS = %w(A A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I
  I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T
  T T T U U U U V V W W X Y Y Z)
  
drawn_letters = []

def draw_letters
  drawn_letters = LETTERS.sample(10)
  return drawn_letters
end

hand = draw_letters
print "This is your hand #{hand}\n"

# Wave 2

def get_user_word
  puts 'Enter your word'
  user_word = gets.chomp
  return user_word
end

def uses_available_letters?(input, letters_in_hand)
  if input.split('') & letters_in_hand == input.split('')
    return true
  else
    return false
  end
end

# Wave 3

def score_word (word)
  score = 0
  word.upcase.split('').each do |letter|
    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      score += 1
    when "D", "G"
      score += 2
    when "B", "C", "M", "P"
      score += 3
    when "F", "H", "G", "W", "Y"
      score += 4
    when "K"
      score += 5
    when "J", "X"
      score += 8
    when "Q", "Z"
      score += 10
    end
  end
  if word.length >= 7 && word.length <= 10
    score += 8
  end
  return score
end

valid_word = ''
user_word = get_user_word
if uses_available_letters?(user_word, hand) #== true
  valid_word = user_word
  puts "#{valid_word} has a score of #{score_word(valid_word)}"
end
  
