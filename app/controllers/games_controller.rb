require 'pry-rails'
class GamesController < ApplicationController

    def new 
    end

    def create 
        selected_word =  params["game"]["word"]
        if selected_word
            num_chars = selected_word.length
            inital_board_layout = "_ " * num_chars
            Game.create(name: selected_word, remaining_num_guesses: 6, guessed_letters: inital_board_layout )
        redirect_to :new_game, notice: "Game created with word #{selected_word}!"
        end
    end


    def show 
       game_id = params[:id] 
       @game = Game.find(game_id)
        num_chars = @game.name.length
        @board_layout = @game.guessed_letters
        
    end

    def update 
        current_game = Game.find(params["id"].to_i)
        guessed_letter = params["game"]["name"].strip

        if current_game && !guessed_letter.blank?
           
           if current_game.name.include?(guessed_letter)
            updated_guessed_letters = current_game.guessed_letters.split(" ")
            current_game.name.each_char.with_index do |c,i|
                if c == guessed_letter
                    updated_guessed_letters[i] = c
                end
            end
            Game.update(current_game.id, guessed_letters: updated_guessed_letters.join(" "))
            redirect_to current_game, notice: "Letter: #{guessed_letter} was correct!"
        else
            Game.update(current_game.id, remaining_num_guesses: current_game.remaining_num_guesses - 1)
            redirect_to current_game, notice: "Letter: #{guessed_letter} was incorrect!"
           end
        end
    end
end
