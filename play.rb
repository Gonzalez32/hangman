
class Hangman

    def initialize 
        @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 6
        @correct_guesses = []
        @word_teaser = ""
 
        @word.first.size.times do 
            @word_teaser += "_ "
        end

    end

    def words 
        [
        ["cricket", "A game Played by Gentlemen"],
        ["jogging", "We are not wailking..."],
        ["celecrate", "Remenbering special moments"],
        ["continent", "Threr are 7 of these"],
        ["exotic", "Not from around here..."],
        ]
    end

    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end

    def update_teaser last_guess
        new_teaser = @word_teaser.split

        #['_', '_', '_'] replace blank values with letter if matches letter in word
        new_teaser.each_with_index do |letter, index|
            if letter == '_' && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
        end

        @word_teaser = new_teaser.join(' ')
    end


    def make_guess 
        if @lives > 0 
        puts "Enter a letter"
            guess = gets.chomp

            # if letter is not part of the word then remove from letters array 
            good_guess = @word.first.include? guess 

            if guess == "exit"
                puts "-------------------------"
                puts "Thank You For Playing!"
                puts "-------------------------"
            elsif good_guess
                puts "You Are Correct!"

                @correct_guesses << guess

                #remove correct guess from Alphabet
                @letters.delete guess


                print_teaser guess
                make_guess
            else
                @lives -= 1
                puts "Sorry, You Have #{ @lives } Lives Left. Try Again!"
                make_guess
            end
        else
            puts "--------------------------------"
            puts "GAME OVER! BETTER LUCK NEXT TIME."
            puts "--------------------------------"

        end
    end 

    def begin
        #ask user for a letter
        puts "New game started.... your word is #{ @word.first.size } characters long"
        puts "---------------------------------------"
        puts "To Exit Game At Any Point, Type 'exit' " 
        puts "---------------------------------------"

        print_teaser

        puts "Clue: #{ @word.last }"

        make_guess
    end

end


game = Hangman.new 
game.begin
