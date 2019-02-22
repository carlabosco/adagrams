LETTER_POOL = %w(A A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I
  I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T
  T T T U U U U V V W W X Y Y Z)
  
def display_welcome_message
  puts "Welcome to Adagrams!"
end

def draw_letters
  drawn_letters = LETTER_POOL.sample(10)
  return drawn_letters
end

def display_drawn_letters(letters)
  puts "You have drawn the letters:"
  puts letters.join(', ')
end

def display_game_instructions
  puts "Please input your submission for the longest anagram you can come up with"
end

def display_needs_valid_input_message
  puts "You entered in a word that contains characters not in the letter bank"
  display_game_instructions
end

def display_score(score)
  puts "Your submitted anagram scored #{score} points"
end

def display_retry_instructions
  puts "Should we play another round?"
  puts "Enter y to replay"
end

def display_goodbye_message
  puts "Thanks for playing Adagrams!"
end


# Wave 2
user_input_word = ''
def get_user_input
  user_input_word = gets.chomp
  return user_input_word
end

def uses_available_letters?(input, letters_in_hand)
  chars = input.upcase.split('')
  letters_in_hand.each do |l|
    i = chars.index(l)
    next if i.nil?
    chars.delete_at(i)
    return true if chars.empty?
  end
  false
end

#puts uses_available_letters?("bb", ['B','B','D'])


def score_word(word)
  points = 0
  word.split('').each do |letter|
    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      points += 1
    when "D", "G"
      points += 2
    when "B", "C", "M", "P"
      points += 3
    when "F", "H", "G", "W", "Y"
      points += 4
    when "K"
      points += 5
    when "J", "X"
      points += 8
    when "Q", "Z"
      points += 10
    end
  end
  if word.length >= 7 && word.length <= 10
    points += 8
  end
  return points
end


def run_game
  display_welcome_message

  should_continue = true

  while should_continue
    puts "Let's draw 10 letters from the letter pool..."

    letter_bank = draw_letters
    display_drawn_letters(letter_bank)

    display_game_instructions

    user_input_word = get_user_input

    while ( !(uses_available_letters?(user_input_word, letter_bank)) )
      display_needs_valid_input_message
      user_input_word = get_user_input
    end
    
    score = score_word(user_input_word)
    
    display_score(score)

    display_retry_instructions
    should_continue = get_user_input == "y"
  end

  display_goodbye_message
end


run_game

# # Wave 3

# def score_word (word)
#   score = 0
#   word.split('').each do |letter|
#     case letter
#     when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
#       score += 1
#     when "D", "G"
#       score += 2
#     when "B", "C", "M", "P"
#       score += 3
#     when "F", "H", "G", "W", "Y"
#       score += 4
#     when "K"
#       score += 5
#     when "J", "X"
#       score += 8
#     when "Q", "Z"
#       score += 10
#     end
#   end
#   if word.length >= 7 && word.length <= 10
#     score += 8
#   end
#   return score
# end

# # valid_word = ''
# # user_word = get_user_word
# # if uses_available_letters?(user_word, hand) #== true
# #   valid_word = user_word
# #   puts "#{valid_word} has a score of #{score_word(valid_word)}"
# # end


# def display_score(score)
#   puts "Your submitted anagram scored #{score} points"
# end

# def display_needs_valid_input_message
#   puts "You entered in a word that contains characters not in the letter bank"
#   display_game_instructions
# end

  
