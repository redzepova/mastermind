## Code and guesses
class Code
    include Display
    attr_accessor :code
  
    CHOICES = [1, 2, 3, 4, 5, 6].freeze
  
    def initialize(mode = 'CB')
      mode == 'CB' ? create_code : create_random_code
    end
  
    def create_code
      guess_text
      @code = gets.chomp.split(//).map(&:to_i)
      puts @code.to_s
    end
  
    def create_random_code
      @code = CHOICES.repeated_permutation(5).to_a.sample
      puts @code.to_s
    end
end  