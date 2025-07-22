class Element
    attr_accessor :name
    def initialize(name)
        @name = name
    end

    def compare_to(opp_element)
        fail "This method should be overridden"
    end
end

class Rock < Element
    def compare_to(opp_element)
        case opp_element.name
        when 'Rock' then
            return 'Rock equals Rock', 'Tie'
        when 'Paper' then
            return 'Paper covers Rock', 'Lose'
        when 'Scissors' then
            return 'Rock crushes Scissors', 'Win'
        when 'Lizard' then
            return 'Rock crushes Lizard', 'Win'
        when 'Spock' then
            return 'Spock vaporizes Rock', 'Lose'
        end
    end
end

class Paper < Element
    def compare_to(opp_element)
        case opp_element.name
        when 'Rock' then
            return 'Paper covers Rock', 'Win'
        when 'Paper' then
            return 'Paper equals Paper', 'Tie'
        when 'Scissors' then
            return 'Scissors cut Paper', 'Lose'
        when 'Lizard' then
            return 'Lizard eats Paper', 'Lose'
        when 'Spock' then
            return 'Paper disproves Spock', 'Win'
        end
    end
end

class Scissors < Element
    def compare_to(opp_element)
        case opp_element.name
        when 'Rock' then
            return 'Rock crushes Scissors', 'Lose'
        when 'Paper' then
            return 'Scissors cut Paper', 'Win'
        when 'Scissors' then
            return 'Scissors equals Scissors', 'Tie'
        when 'Lizard' then
            return 'Scissors decapitate Lizard', 'Win'
        when 'Spock' then
            return 'Spock smashes Scissors', 'Lose'
        end
    end
end

class Lizard < Element
    def compare_to(opp_element)
        case opp_element.name
        when 'Rock' then
            return 'Rock crushes Lizard', 'Lose'
        when 'Paper' then
            return 'Lizard eats Paper', 'Win'
        when 'Scissors' then
            return 'Scissors decapitate Lizard', 'Lose'
        when 'Lizard' then
            return 'Lizard equals Lizard', 'Tie'
        when 'Spock' then
            return 'Lizard poisons Spock', 'Win'
        end
    end
end

class Spock < Element
    def compare_to(opp_element)
        case opp_element.name
        when 'Rock' then
            return 'Spock vaporizes Rock', 'Win'
        when 'Paper' then
            return 'Paper disproves Spock', 'Lose'
        when 'Scissors' then
            return 'Spock smashes Scissors', 'Win'
        when 'Lizard' then
            return 'Lizard poisons Spock', 'Lose'
        when 'Spock' then
            return 'Spock equals Spock', 'Tie'
        end
    end
end

$moves = [Rock.new('Rock'), Paper.new('Paper'), Scissors.new('Scissors'), Lizard.new('Lizard'), Spock.new('Spock')]
