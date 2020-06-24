
class Hangman

    def initialize 
        @word = words.sample
        @lives = 6
        @word_teaser = ""
 
        @word.first.size.times do 
            @word_teaser += "_ "
        end

    end

    def words 
        [
        ["cricket", "A game Played by Gentlemen"],
        ["jogging", "We are not wailking..."],
        ["celebrate", "Remembering special moments"],
        ["continent", "There are 7 of these"],
        ["exotic", "Not from around here..."],
        ]
    end

    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end

    def update_teaser last_guess
        new_teaser = @word_teaser.split

        new_teaser.each_with_index do |letter, index|
            #['_', '_', '_'] replace blank values with letter if matches letter in word
            if letter == '_' && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
        end

        @word_teaser = new_teaser.join(' ')
    end


    def make_guess 
        if @lives > 0 
            puts "^^^^^^^^^^^^^^"
            puts "ENTER A LETTER!"
            puts "^^^^^^^^^^^^^^"
            guess = gets.chomp

            # if letter is not part of the word then remove from letters array 
            good_guess = @word.first.include? guess 

            if guess == "exit"
                puts "-------------------------"
                puts "Thank You For Playing!"
                puts "-------------------------"
            elsif good_guess
                puts "%%%%%%%%%%%%%%%%"
                puts "You Are Correct!"
                puts "%%%%%%%%%%%%%%%%"

                print_teaser guess 

                if @word.first == @word_teaser.split.join
                    puts "*********************************************"
                    puts "Congratulations!!!!, You Have Won This Round!"
                    puts "*********************************************" 
                else
                    make_guess
                end

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
        puts "-----------------------------------------------------------------------"
        puts "New game started.... your word is #{ @word.first.size } characters long"
        puts "-----------------------------------------------------------------------"

        puts "---------------------------------------"
        puts "To Exit Game At Any Point, Type 'exit' " 
        puts "---------------------------------------"

        print_teaser
        puts "                     "
        puts "                     "
        puts "Clue: #{ @word.last }"
        puts "                     "
        puts "                     "

        make_guess
    end

end


game = Hangman.new 
game.begin
