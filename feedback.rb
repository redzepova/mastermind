# frozen_string_literal: true

## This is the module to evalute codes/guesses and give feedback
class Feedback
  attr_accessor

  def initialize(code, guess)
    @code = code
    @guess = guess
  end

  def find_exact_matches
    matches = 0
    @guess.each_with_index do |element, index|
      next unless @code[index] == element

      matches += 1
      @guess[index] = nil
      @code[index] = nil
    end
    matches
  end

  def find_near_matches(_code, _guess)
    near_matches = 0
    @code.each_with_index do |element, index|
      next unless @guess.any?(element)

      near_matches += 1
      @code[index] = nil
      @guess.index[element] = nil
    end
    near_matches
  end
end
