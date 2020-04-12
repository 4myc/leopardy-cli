require 'pry'
class CommandLineInterface

    # Method to add blank lines
    def blank_line(num)
        num.times do
            puts ""
        end
    end

    #---------- WELCOME PAGE && MENU ----------#
    def menu
        system('clear')
        # system("printf '\e[8;50;93t'") --> text color
        blank_line(4)
        puts "..................................................   WELCOME TO   .................................................."
        blank_line(4)
        puts "\e[93m       ://:        ://///////. .////////:  ./////////.   ://////:   :////////:   :////////:  ://:   ://. ://:"
        puts "       ://:        ://///////. ://///////. ://///////.  .///////:   ://///////.  ://///////. ://:   ://. ://:"
        puts "       ://:        ://///////. ://///////. ://///////.  .////////   ://///////.  ://///////. ://:   ://. ://:"
        puts "       ://:        ://///////. ://///////. ://///////.  /////////.  ://///////.  ://///////. ://:   ://. ://:"
        puts "       ://:        ://///////. ://///////. ://///////.  /////////.  ://///////.  ://///////. ://:   ://. ://:"
        puts "       ://:        ://///////` ://///////. ://///////.  /////////:  ://///////.  ://///////. ://:   ://. ://:"
        puts "       ://:        :///:       :///: :///. ://:  :///. .///:  ://:  ://:   ://.  ://:   ://. ://:   ://. ://:"
        puts "       ://:        :///:       :///: :///. ://:  :///. .///:  :///  ://:   ://.  ://:   ://. ://:   ://. ://:"
        puts "       ://:   ://. ://///////: :///: :///. ://///////. .//////////. :///::://:   ://:   ://. ://///////. ://:"
        puts "       ://:   ://. ://///////: :///: :///. :///:::::-` .///::::///. :///:::///:  ;//:   ://. `::::::///. ://:"
        puts "       ://:   ://. :///:       :///: :///. :///        :///    ///. :///   ////. ://:   ://.        ://.     "
        puts "       ://:   ://. :///:       :///: :///. :///        :///    ///. :///    ///. ://:   ://.        ://. ::::"
        puts "       :///:::///. ://///////. :///:::///. :///        :///    ///. :///    ///. ://::::///.    ::::://. ::::"  
        puts "       :::::::::-` `:::::::::. `:::::::::` ::::        ::::    :::: ::::    :::: :::::::::-`    ::::::-`     \e[97m"
        blank_line(4)
        puts "...................................................................................................................."
        puts ""
        # user_input = gets.strip --> .strip removes white space before && after input
        # user_input = gets.chomp  --> .chomp removes white space after input

        blank_line(2)
        puts "                                             ............................."
        puts "                                                                          "
        puts "                                                \e[93m   MAKE A SELECTION:     \e[97m"
        puts "                                                                          "
        puts "                                             ............................."
        puts "                                                 1 /     PLAY!            "        # CREATE --> create a player and start the game
        puts "                                             ............................." 
        puts "                                                 2 /     LEADERBOARD      "        # READ --> view questions and answers; view scores of players
        puts "                                             ............................." 
        puts "                                                 3 /     UPDATE PLAYER    "        # UPDATE --> change player name
        puts "                                             ............................." 
        puts "                                                 4 /     DELETE PLAYER    "        # DELETE --> delete player
        puts "                                             ............................." 
        puts "                                                 5 /     EXIT             " 
        puts "                                             ............................." 
        blank_line(4)
        option
    end

    #---------- CREATE ----------#
    def create_player
        system('clear')
        # Add function to return "Sorry, player already exists. Please enter another name."
        while true
            blank_line(4)
            puts "Please enter your name:"
            print "--> "

            name_input = gets.chomp
            player = Player.create(name: name_input)

            system('clear')
            blank_line(2)
            puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
            blank_line(6)
            puts "                HELLO, \e[93m[ #{name_input} ]. \e[97mLET'S PLAY!"
            blank_line(6)
            puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
            blank_line(2)
            puts "Press Enter to Start"

            user_input = gets.chomp
            leopardy_round # Goes to ROUND #1 - Leopardy! screen
          break
        end
    end

    #---------- READ ----------#
    # ROUND #1 -- LEOPARDY!
    def leopardy_round
        # binding.pry
        
        # 1)start game at ROUND #1 -- Leopardy!
        # 2)generate random question clue and associated with 3 multiple choice answers
        # 3)player enters answer
        # 4)check if player's answer if correct
        # 5)return correct or incorrect message
        # 6)if answered correctly, add to player's score
        # 7)show player's score out of 3
        # 8)go to ROUND #2 -- Double Leopardy!
        # 9)REPEAT steps 1-8 for ROUND #3 -- Final Leopardy!
        # 10)go to final score page
        #11)press enter to exit game && show exit page
        system('clear')
        while true 
        blank_line(4)
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        blank_line(8)
        puts "\e[93m                            ROUND 1:"
        puts ""
        puts "                           LEOPARDY!\e[97m"
        
        #----- ROUND LOOP BEGINS -----#
        blank_line(6)
        #Return a random question --> question 
        round = Question.all.sample
        puts round.clue  #Returns clue object


        puts ""

        #Return answers as numbered strings
        round.answers.each_with_index do |answer, index|
            puts "  : #{index + 1} :   #{answer.content}"
        end
        blank_line(8)

        #correct_answer is an array
        correct_answer = round.answers.select {|answer| answer.correct == true}
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

        print "--> "
        user_input = gets.chomp.downcase
        selected_answer = ""
        if user_input == "1"
            selected_answer = round.answers[0]
        elsif user_input == "2"
            selected_answer = round.answers[1]
        elsif user_input == "3"
            selected_answer = round.answers[2]
        else
            puts "ROAR! \e[93m[ #{user_input} ]\e[97m is not an option. Please make another selection."
            user_input = gets.chomp.downcase
            #recall answer selection method
        end

        if correct_answer[0] == selected_answer
            puts "\e[93mCORRECT!\e[97m"
            puts ""
            # puts "Your score is []/3"

            # @player.score += 1
            # Display score out of 3, e.g. 1/3
            puts "Press Enter to continue to DOUBLE LEOPARDY!"
            user_input = gets.chomp
            
        double_leopardy_round
        else
            #notify player that their answer is incorrect and start the next round
            # Display score out of 3, e.g. 1/3
            puts "\e[93mINCORRECT!\e[97m"
            puts ""
            puts "Press Enter to continue to DOUBLE LEOPARDY!"
            user_input = gets.chomp
        double_leopardy_round
        end
        blank_line(8)
        #----- ROUND LOOP ENDS -----#
        
        break
        end
    end

    # ROUND #2 -- DOUBLE LEOPARDY!
    def double_leopardy_round
        system('clear')

        while true 
        blank_line(4)
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        blank_line(8)
        puts "\e[93m                            ROUND 2:"
        puts ""
        puts "                        DOUBLE LEOPARDY!\e[97m"

        #----- ROUND LOOP BEGINS -----#
        blank_line(6)
        #Return a random question
        round = Question.all.sample
        puts round.clue #Returns clue object
        puts ""

        #Return answers as strings
        round.answers.each_with_index do |answer, index|
            puts "  : #{index + 1} :   #{answer.content}"
        end
        blank_line(8)

        #correct_answer is an array
        correct_answer = round.answers.select {|answer| answer.correct == true}
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

        print "--> "
        user_input = gets.chomp.downcase
        selected_answer = ""
        if user_input == "1"
            selected_answer = round.answers[0]
        elsif user_input == "2"
            selected_answer = round.answers[1]
        elsif user_input == "3"
            selected_answer = round.answers[2]
        else
            puts "ROAR! \e[93m[ #{user_input} ]\e[97m is not an option. Please make a valid selection."
            # user_input = gets.chomp.downcase
            #recall answer selection method
        end

        if correct_answer[0] == selected_answer
            puts "\e[93mCORRECT!\e[97m"
            puts ""
            puts "Press Enter to continue to FINAL LEOPARDY!"
            user_input = gets.chomp
            # @player.score += 1
            # Display score out of 3, e.g. 1/3
        
        # ADD: Go to player's final score page
        final_leopardy_round
        else
            #notify player that their answer is incorrect and start the next round
            # Display score out of 3, e.g. 1/3
            puts "\e[93mINCORRECT!\e[97m"
            puts ""
            puts "Press Enter to continue to FINAL LEOPARDY!"
            user_input = gets.chomp

        final_leopardy_round
        end
        blank_line(8)
        #----- ROUND LOOP ENDS -----#

        break
        end
    end
        

    # ROUND #3 -- FINAL LEOPARDY!
    def final_leopardy_round
        system('clear')
        
        while true 
        blank_line(4)
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        blank_line(8)
        puts "\e[93m                            ROUND 3:"
        puts ""
        puts "                        FINAL LEOPARDY!\e[97m"

        #----- ROUND LOOP BEGINS -----#
        blank_line(6)
        #Return a random question
        round = Question.all.sample
        puts round.clue #Returns clue object
        puts ""

        #Return answers as strings
        round.answers.each_with_index do |answer, index|
            puts "  : #{index + 1} :   #{answer.content}"
        end
        blank_line(8)

        #correct_answer is an array
        correct_answer = round.answers.select {|answer| answer.correct == true}
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

        print "--> "
        user_input = gets.chomp.downcase
        selected_answer = ""
        if user_input == "1"
            selected_answer = round.answers[0]
        elsif user_input == "2"
            selected_answer = round.answers[1]
        elsif user_input == "3"
            selected_answer = round.answers[2]
        else
            puts "ROAR! \e[93m[ #{user_input} ]\e[97m is not an option. Please make another selection."
            # user_input = gets.chomp.downcase
            #recall answer selection method
        end

        if correct_answer[0] == selected_answer
            puts "\e[93mCORRECT!\e[97m"
            puts ""
            puts "Press Enter to exit game"
            user_input = gets.chomp
            # @player.score += 1
            # Display score out of 3, e.g. 1/3
        
        # ADD: Go to player's final score page
        end_game
        else
            #notify player that their answer is incorrect and start the next round
            # Display score out of 3, e.g. 1/3
            puts "\e[93mINCORRECT!\e[97m"
            puts ""
            puts "Press Enter to exit game"
            user_input = gets.chomp
        # break
        end_game
        end
        blank_line(8)
        #----- ROUND LOOP ENDS -----#

        break
        end
    end

    # def player_final_score

    # end

    # HELPER METHOD to find a player's name
    def find_player(name)
        @player = Player.find_by(name: name)
    end

    # def player_input_option
    #     puts "Push Enter to return to Main Menu"
    #     user_input = gets.chomp.downcase
    #     # while user_input != "exit" do 
    #     #     user_input == "H"
    #             option
    #             # break
    #     # end 
    # end
    
    #---------- UPDATE ----------#
    def update_player
        system('clear')
        while true
        blank_line(4)
        puts "Please enter a player name:"

        print "--> "
        name_input = gets.chomp.downcase
        find_player(name_input)
            if @player == nil
                puts "No player name found!"
                # puts "Push Enter to return to Main Menu"
                # name_input = gets.chomp.downcase
                # menu
                # player_input_option
                # ADD: Give option to go back to MENU
                # option
            else
                found_player = @player
                blank_line(2)
                puts "Please enter a new player name:"
                print "--> "
                new_player_input = gets.chomp.downcase

                found_player.name = new_player_input
                found_player.save
                
                blank_line(4)
                puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
                blank_line(6)
                puts "            Player \e[93m[ #{name_input} ]\e[97m has been updated to \e[93m[ #{new_player_input} ]\e[97m."
                blank_line(6)
                puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
                blank_line(2)
                puts "Press Enter to return to Main Menu"
                
                name_input = gets.chomp.downcase
                menu
                break
            end
        end
    end

    #---------- DELETE ----------#
    def delete_player
        system('clear')
        while true
        blank_line(4)
        puts "Please enter a player name:"

        print "--> "
        name_input = gets.chomp.downcase
        find_player(name_input)
            if @player == nil
                puts "No player name found! Please enter another name."
                
                # ADD: Give option to go back to MENU
            else
                remove_player = @player
                remove_player.destroy
                system('clear')
          
                blank_line(4)
                puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
                blank_line(6)
                puts "            So long! Player \e[93m[ #{name_input} ]\e[97m has been deleted."
                blank_line(6)
                puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
                blank_line(2)
                puts "Press Enter to return to Main Menu"

                name_input = gets.chomp.downcase
                menu
                break
            end
        end
    end
    
    #---------- MENU OPTIONS ----------#
    def option
        print "--> "
        user_input = gets.chomp.downcase
        while user_input != "exit" do 
            if user_input == "1"
                create_player
                break
            elsif user_input == "2"
                leaderboard
                break
            elsif user_input == "3"
                update_player
                break
            elsif user_input == "4"
                delete_player
                break
            elsif user_input == "5"
                end_game
                break
            else 
                puts "ROAR! \e[93m[ #{user_input} ]\e[97m is not an option. Please make another selection."
                print "--> "
                user_input = gets.chomp
            end 
        end 
    end 

    #---------- EXIT MESSAGE ----------# 
    def end_game
        system('clear')
        blank_line(4)
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        blank_line(10)
        puts "                                                  THANK YOU FOR PLAYING"
        blank_line(2)
        puts "\e[93m                                                         LEOPARDY!\e[97m"

        blank_line(10)
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        blank_line(2)
        puts "Press Enter to return to Main Menu"

        user_input = gets.chomp.downcase
        if user_input != "exit"
        menu
        end
    end
end