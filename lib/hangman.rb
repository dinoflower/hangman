require 'pry-byebug'
require_relative 'hangman/version'
require_relative 'hangman/game'

module Hangman
  class Error < StandardError; end
  Game.new(Game.pick_word).play_game
end

# if saved file exists, ask if player would like to load saved file
# if yes, open saved file and continue
# if no, the program will choose a random word from the .txt file
# display underscores for each letter, separated by spaces for clarity
# prompt player to guess a letter
# take first letter player submits, case insensitive
# if present in the word, display all instances, replacing the underscores
# if absent, add to "guesses" array, and display along with a message re: lives remaining
# prompt player (and ask if they would like to save)
# continue until word is solved or player runs out of lives
# dislay win/loss message