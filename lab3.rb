require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  Noddy Lam						 	#
#  lamno@oregonstate.edu               	#
#										#
#########################################



def player_choice(num)
    loop do
        print "Select player #{num}: "
        choice = gets.chomp.to_i
        case choice
        when 1 then
            return StupidBot.new('StupidBot', History.new)
        when 2 then
            return RandomBot.new('RandomBot', History.new)
        when 3 then
            return IterativeBot.new('IterativeBot', History.new)
        when 4 then
            return LastPlayBot.new('LastPlayBot', History.new)
        when 5 then
            return Human.new('Human', History.new)
        else
            # if the input is not valid then $is_valid is true and error message will be displayed below
            $is_invalid = true
            break
        end

    end
end


def game(rounds)
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!\n\n"
    puts "Please choose two players:"
    puts "(1) StupidBot"
    puts "(2) RandomBot"
    puts "(3) IterativeBot"
    puts "(4) LastPlayBot"
    puts "(5) Human"

    #Do while loop to ensure input is within range, loop again if not
    loop do
        $is_invalid = false
        $p1 = player_choice(1) # Use method above to initialize each player type
        $p2 = player_choice(2)
        if $is_invalid then
            puts "Invalid choice(s) - start over\n\n"
        else
            break
        end
    end
    puts "#{$p1.name} vs. #{$p2.name}\n\n"

    # loop for set amount of rounds
    for i in 1..rounds
        puts "Round #{i}:"

        # Set each player's move
        p1move = $p1.play
        p2move = $p2.play

        # Log opponent play after both players have selected a move
        $p1.history.log_opponent_play(p2move)
        $p2.history.log_opponent_play(p1move)

        # Displays the game
        puts "Player 1 chose #{p1move.name}"
        puts "Player 2 chose #{p2move.name}"
        outcome, result = p1move.compare_to(p2move)
        puts outcome # e.g. Spock vaporizes Rock

        if result == 'Win'
            puts "Player 1 won the round"
            $p1.history.add_score # Add score to see who wins at the end
        elsif result == 'Lose'
            puts "Player 2 won the round"
            $p2.history.add_score
        else
            puts "Round was a tie"
        end
        puts "\n"
    end

    puts "Final score is #{$p1.history.score} to #{$p2.history.score}"
    if $p1.history.score > $p2.history.score then
        puts "Player 1 wins"
    elsif $p1.history.score < $p2.history.score then
        puts "Player 2 wins"
    else
        puts "Game was a draw"
    end
end


# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)