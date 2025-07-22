class Player
    require_relative "element"
    require_relative "history"
    attr_reader :name, :history

    def initialize(name, history)
        @name = name
        @history = history
    end

    def play
        fail "This method should be overridden"
    end
end

# play Rock each and every time
class StupidBot < Player
    def play
        move = $moves[0]
        @history.log_play(move) # log play each time
        return move
    end
end

# randomly pick and return one of the five possible moves
class RandomBot < Player
    def play
        move = $moves.sample #takes a random element in array each time
        @history.log_play(move)
        return move
    end
end

# cycles through all the moves, one by one in order
class IterativeBot < Player
    # Takes superclass from Player and adds an index
    def initialize(name, history)
        super(name, history)
        @index = 0
    end
    def play
        move = $moves[@index]
        @history.log_play(move)
        # if size of $moves array is reached, go back to the start of array
        @index = (@index + 1) % $moves.size
        return move
    end
end

# will always play the move that the opponent played on the previous move.
# For the first move, since there was no previous move to reference, return Rock
class LastPlayBot < Player
    def play
        # if first move, return rock else return opp last play
        if @history.opponent_plays.empty?
            move = $moves[0]
        else
            move = @history.opponent_plays.last
        end
        @history.log_play(move)
        return move
    end
end

# ask the user to determine the move
class Human < Player
    def play
        loop do
            puts "(1) Rock"
            puts "(2) Paper"
            puts "(3) Scissors"
            puts "(4) Lizard"
            puts "(5) Spock"
            print "Enter your move: "
            human_move = gets.chomp.to_i
            if (human_move >= 1 && human_move <= 5)
                move = $moves[human_move-1]
                @history.log_play(move)
                return move
            end
            puts "Invalid move - try again\n"
        end


    end
end


