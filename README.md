# Welcome to LEOPARDY!

LEOPARDY! is a multiple choice trivia game about leopards, based on the popular trivia game show Jeopardy! and Pup Quiz from The Tonight Show Starring Jimmy Fallon.

## Installation Instructions

1. Fork and clone this repository.
2. In the terminal, run:
    ```bash 
    bundle install
    rake db:migrate
    rake db:seed
    ```
5. Once the above steps are done, load the game by running:
    ```bash 
    ruby bin/run.rb
    ```

## How to Play

1. In the welcome page, make a selection from the main menu. The menu options include: 
    ```bash
    1. PLAY!
    2. LEADERBOARD
    3. UPDATE PLAYER
    4. DELETE PLAYER
    5. EXIT
    ```
3. To start a game, select PLAY! from the menu and enter a name.
4. The game starts at the LEOPARDY! round. The first question clue and three multiple choice answers will be generated. Select an answer and it will be revealed to be correct or incorrect.
6. Press Enter to continue to the next round, DOUBLE LEOPARDY!. The second question clue and three multiple choice answers will be generated. Select an answer and it will be revealed to be correct or incorrect.
8. Press Enter to continue to the last round, FINAL LEOPARDY! A final question clue and three multiple choice answers will be generated. Select an answer and it will be revealed to be correct or incorrect. The game has finished, press Enter to exit the game.
10. To play again, press Enter to return to the main menu and select "PLAY!."
