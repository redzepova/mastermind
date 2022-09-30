# frozen_string_literal: true

require_relative 'display'
require_relative 'code'

# #This is the human player. Can be codemaker or breaker
class HumanCodeBreak
  include Display
  include Code
  attr_accessor :guess, :code

  def initialize; end

  def make_guess
    puts create_code_text('guess')
    @guess = create_code('guess')
  end

  

  def role(choice)
    choice == 1 ? 'CM' : 'CB'
  end
end
