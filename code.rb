# frozen_string_literal: true

require_relative 'display'

## Code and guesses
module Code
  include Display

  CHOICES = [1, 2, 3, 4, 5, 6].freeze

  def create_code
    code = gets.chomp.split(//).map(&:to_i)
    puts @code.to_s
  end

  def create_random_code
    code = CHOICES.repeated_permutation(5).to_a.sample
    puts code.to_s
  end

  def check_code_errors(code)
    #something here
  end
end
