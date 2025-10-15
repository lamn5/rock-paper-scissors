# Ruby Rock Paper Scissors Lizard Spock Against Bots

A Ruby implementation of the extended Rock Paper Scissors Lizard Spock game with multiple bot opponents and test cases.

## Features

-   Play Rock, Paper, Scissors, Lizard, Spock
-   5 different player types including Human and 4 unique bots
-   Best of 5 rounds gameplay
-   Track game history and scores
-   Comprehensive test suite
-   Clean, object-oriented design

## Game Rules

Rock Paper Scissors Lizard Spock is an extension of the classic Rock Paper Scissors game, adding two more options to reduce the chance of ties.

### How Each Move Wins

Each move defeats exactly two other moves and loses to two other moves:

-   **Rock** crushes Scissors and crushes Lizard
-   **Paper** covers Rock and disproves Spock
-   **Scissors** cut Paper and decapitate Lizard
-   **Lizard** eats Paper and poisons Spock
-   **Spock** vaporizes Rock and smashes Scissors

### Winning Combinations

| Your Move | Defeats          | Loses To         |
| --------- | ---------------- | ---------------- |
| Rock      | Scissors, Lizard | Paper, Spock     |
| Paper     | Rock, Spock      | Scissors, Lizard |
| Scissors  | Paper, Lizard    | Rock, Spock      |
| Lizard    | Paper, Spock     | Rock, Scissors   |
| Spock     | Rock, Scissors   | Paper, Lizard    |

## How to Play

### Prerequisites

-   Ruby 2.6 or higher

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/lamn5/rock-paper-scissors.git
    cd rock-paper-scissors
    ```

### Running the Game

To start the game, run:

```bash
ruby main.rb
```

### Gameplay Instructions

1. **Choose Two Players**: When the game starts, you'll be prompted to select two players from:

    - **(1) StupidBot** - Always plays Rock
    - **(2) RandomBot** - Randomly selects any move
    - **(3) IterativeBot** - Cycles through all moves in order
    - **(4) LastPlayBot** - Plays whatever the opponent played last round
    - **(5) Human** - You control the moves!

2. **Play 5 Rounds**: The game consists of 5 rounds. If you're playing as Human:

    - Each round, you'll see a menu with the 5 moves
    - Enter the number (1-5) corresponding to your choice
    - Invalid selections will prompt you to try again

3. **Watch the Results**: After each round, you'll see:

    - What each player chose
    - The outcome (e.g., "Rock crushes Scissors")
    - Who won the round
    - Current score

4. **Final Score**: After 5 rounds, the player with the most round wins is declared the overall winner!

### Example Game Session

```
Welcome to Rock, Paper, Scissors, Lizard, Spock!

Please choose two players:
(1) StupidBot
(2) RandomBot
(3) IterativeBot
(4) LastPlayBot
(5) Human
Select player 1: 5
Select player 2: 2
Human vs. RandomBot

Round 1:
(1) Rock
(2) Paper
(3) Scissors
(4) Lizard
(5) Spock
Enter your move: 1
Player 1 chose Rock
Player 2 chose Scissors
Rock crushes Scissors
Player 1 won the round

...

Final score is 3 to 2
Player 1 wins
```

### Running Tests

The project includes test cases in the `tests/` directory. You can run the test suite with:

```bash
ruby test.rb
```

## Project Structure

-   `main.rb` - Main game file and entry point
-   `player.rb` - Player class and bot implementations (StupidBot, RandomBot, IterativeBot, LastPlayBot, Human)
-   `element.rb` - Game elements (Rock, Paper, Scissors, Lizard, Spock) with win/lose logic
-   `history.rb` - Game history tracking and score management
-   `test.rb` - Test runner
-   `tests/` - Contains test input and expected output files

## Strategy Tips

-   **Against StupidBot**: Always choose Paper (Paper covers Rock)
-   **Against RandomBot**: No guaranteed strategy - it's random!
-   **Against IterativeBot**: Predict the cycle and counter accordingly
-   **Against LastPlayBot**: Play a move that loses, then counter your own move next round

## License

This project is open source and available under the [MIT License](LICENSE).
