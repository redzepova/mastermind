class CodeMaker
    attr_accessor :name, :code, :feedback

    def initialize (name)
        @name = name
        colors = ["R","G","B","I","V"].repeated_permutation(4).to_a.sample
        @code = colors
        puts "computer selected #{@code}"
    end

    def gives_feedback(guess)
        feedback = find_matches(guess)
        feedback.each {|element| element == nil ? element = "[  ]" : next}
        puts "Feedback: #{feedback}"
    end


    def find_matches(guess)
        temp_code = @code
        temp_guesses = guess
        feedback = Array.new(guess.length)
       

        temp_guesses.each_with_index do |element, index|
            if temp_code[index] == element
                feedback[index] = "[ X ]"
                temp_code[index] = nil
                temp_guesses[index] = nil
            else
                feedback[index] = nil
            end
        end

        feedback.each_with_index do |element, index|
            if element == nil
                if temp_code.any?(temp_guesses[index])
                    feedback[index] = "[ O ]"
                    temp_code[temp_code.index{|c| c == temp_guesses[index]}] = nil
                end
            end
            temp_guesses[index] = nil   
        end

        return feedback
    end
end

class CodeBreaker
    attr_accessor :name

    def initialize (name)
        @name = name
    end
end

class Game
    attr_accessor

    def initialize ()


    end

    
end

   



puts "Hello, player! What's your name?"
name = gets.chomp

code_maker = CodeMaker.new("Computer")
code_breaker = CodeBreaker.new(name)

my_guess = ["B", "R", "B", "B"]

puts "#{code_breaker.name} guessed: #{my_guess}"
code_maker.gives_feedback(my_guess)
