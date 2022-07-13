# frozen_string_literal: true

module Hangman
  class Game
    def initialize(word)
      @word = word
    end
  
    def self.pick_word
      dictionary = File.read("google-10000-english-no-swears.txt").split
      puts dictionary.sample
    end
  end
end

# if no, the program will choose a random word from the .txt file
# display underscores for each letter, separated by spaces for clarity
# prompt player to guess a letter
# take first letter player submits, case insensitive
# if present in the word, display all instances, replacing the underscores
# if absent, add to "guesses" array, and display along with a message re: lives remaining
# prompt player (and ask if they would like to save)
# continue until word is solved or player runs out of lives
# dislay win/loss message
