# frozen_string_literal: true

require "rubocop"
require_relative "hangman/version"
require_relative "hangman/game"

# module for a word-guessing game with save and load features
module Hangman
  class Error < StandardError; end

  def self.start_game
    if Dir.exist?("data") && !Dir.empty?("data")
      puts "Would you like to load a saved game? (y/n)"
      answer = STDIN.gets.chr.upcase
      answer == "Y" ? Game.load_save.play_game : Game.new(Game.pick_word).play_game
    else
      Game.new(Game.pick_word).play_game
    end
  end
end

Hangman.start_game
