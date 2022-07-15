require_relative 'hangman/version'
require_relative 'hangman/game'
require_relative 'hangman/serializable_save'

module Hangman
  class Error < StandardError; end
  def start_game
    if Dir.exist?('data')
      puts 'Would you like to load a saved game? (y/n)'
      answer = gets.chr.upcase
      answer == 'Y' ? Game.load_save : Game.new(Game.pick_word).play_game
    else
      Game.new(Game.pick_word).play_game
    end
  end
  start_game
end

# if saved file exists, ask if player would like to load saved file
# if yes, open saved file and continue
# if no, the program will choose a random word from the .txt file
# prompt player (and ask if they would like to save)
# continue until word is solved or player runs out of lives
