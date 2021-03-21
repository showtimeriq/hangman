require 'pry-rails'
class GamesController < ApplicationController

    def new 
    end

    def create 
        selected_word =  params["game"]["word"]

        if selected_word
            Game.create(name: selected_word)
        redirect_to :new_game, notice: "Game created with word #{selected_word}!"
        end

    end

end
