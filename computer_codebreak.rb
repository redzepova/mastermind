# frozen_string_literal: true

require_relative 'code'
require_relative 'display'

class ComputerCodebreak
  include Code
  include Display
  attr_accessor :code

  def initialize
    my_code
  end

  def my_code
    puts create_code_text('code')
    @code = create_code
  end
end
