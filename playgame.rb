class Game
    def initialize
        @word = words_lists.sample
        @lives = 6
        @words_sample = ""

        @word.first.size.times do
           @words_sample += "_ " 
        end
    end

    def words_lists
        [
            ["messi", "Best football player ever! Some may say otherwise..."],
            ["pac man", "Little guy always hungry and is my old buddy."],
            ["rainbow", "Sometimes it comes and goes with a smell of rain."]
        ]
    end

    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end

    def update_teaser last_guess
       new_teaser = @word_teaser.split
       
       new_teaser.each_with_index do |letter, index|
        # ['_','_','_'] replace blank values with letter if it matches letter in word
            if letter == '_' && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
        end

        @word_teaser = new_teaser.join(' ')
    end

    def make_guess
        if @lives > 0
            puts "============"
            puts "Hey you user enter a letter please!"
            puts "============"
            guess = gets.chomp
            # letter is not part of the word then remove from letter array
            good_guess = @word.first.include? guess

            if guess == "exit"
                puts "########################################"
                puts "Thank you for playing see you next time."
                puts "########################################"
            elsif good_guess
                puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
                puts "You are correct keep going lad!"
                puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

                print_teaser guess

                if @word.first == @word_teaser.split.join
                    puts "Congratulations!!! Yay you have won this round!"
                else
                    make_guess
                end
            
            else
                @lives -=1
                puts "Sorry, you have #{ @lives } lives left... Try again lad."
                make_guess
            end
        else
            puts "GAME OVER! Better luck next time."
        end
    end

    def begin
        # asked user for a letter
        puts "next time line 76"

end