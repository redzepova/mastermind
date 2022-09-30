# frozen_string_literal: true

## module to display all text
module Display
  def game_options
    puts "Select difficulty level. \n
          1 - Easy  2 - Medium  3 - Difficult"
    gets.chomp.to_i
  end

  def mode_selection
    puts "Do you want to be the Code Maker, or the Code Breaker? \n
        1 - Code Maker  2 - Code Breaker"
  end

  def show_rules
    puts 'Would you like to see the game rules before we start? Y/N'
    answer = gets.chomp
    game_rules(answer)
  end

  def game_rules(ans)
    return unless ans == 'Y'

    puts "Mastermind is a logic game. One player chooses a code. The other player must guess that code
  within the specified number of turns.

  Each code is 5 numbers long, and each number can be between 1-6. Numbers may repeat.

  Once the Code Maker has created a code, the Code Breaker must enter their guess. The Computer will analyze the
  code and return feedback for each digit of the code.
      [ O ] - Right digit, but wrong spot
      [ X ] - Right digit, right spot

  For example, if the code is 12655, and the Code Breaker guesses 22456, the feedback would be:
      [X][X][O]

  Now onto the game!
  "
  end

  def guess_text
    puts 'Enter your code. Codes must be 5 digits long, and can use whole numbers between 1-6'
  end

  def bad_choice
    puts 'You must select a number from 1 -6. Try again.'
  end

  def winner_text
    puts 'Congratulations! You won!'
  end

  def lost_text
    puts 'Better luck next time!'
  end

  def display_feedback(matches, near_matches)
    while matches.positive?
      print '[x]'
      matches += -1
    end
    while near_matches.positive?
      print '[O]'
      near_matches += -1
    end
  end
end
