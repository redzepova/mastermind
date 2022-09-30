# frozen_string_literal: true

require_relative 'display'

# #This is the human player. Can be codemaker or breaker
class HumanCodeBreak
  include Display
  attr_accessor :guess

  def initialize; end

  def make_guess
    @guess = Code.new
  end

  def role(choice)
    choice == 1 ? 'CM' : 'CB'
  end
end
