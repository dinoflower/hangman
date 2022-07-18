require_relative 'hangman/version'
require_relative 'hangman/game'
require_relative 'hangman/serializable_save'

module Hangman  
  class Error < StandardError; end
  def self.start_game
    if Dir.exist?('data') && !Dir.empty?('data')
      puts 'Would you like to load a saved game? (y/n)'
      answer = gets.chr.upcase
      answer == 'Y' ? Game.load_save.play_game : Game.new(Game.pick_word).play_game
    else
      Game.new(Game.pick_word).play_game
    end
  end
end

Hangman.start_game

# currently cannot open save file - or cannot use data from it
# due to module/class discrepencies
