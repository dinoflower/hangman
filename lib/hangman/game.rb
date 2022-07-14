require 'pry-byebug'

module Hangman
  class Game
    attr_accessor :lives, :message, :incorrect_guesses, :guesses_string, :display_hash

    def self.pick_word
      dictionary = File.read('google-10000-english-no-swears.txt').split
      dictionary.select! { |word| word.length > 4 }
      dictionary.sample
    end

    def initialize(word)
      @word = word.upcase
      @lives = 6
      @message = "You have #{@lives} lives remaining. Guess a letter:"
      @incorrect_guesses = []
      @guesses_string = @incorrect_guesses.join(', ')
      @display_hash = {}
    end

    def generate_display
      puts 'Guess the secret word! Six incorrect guesses, and you lose.'
      @word.chars.each_index do |index|
        @display_hash[index] = '_'
      end
      puts @display_hash.values.join(' ')
    end

    def guess_letter
      puts "Incorrect guesses: #{@guesses_string}" || @incorrect_guesses.empty?
      puts @message
      letter = gets.chr.upcase
      check_guess(letter) if letter.match?(/[a-zA-Z]/)

      guess_letter
    end

    def check_guess(letter)
      if @incorrect_guesses.include?(letter) || @display_hash.value?(letter)
        puts 'You have already guessed that letter.'
        guess_letter
      elsif @word.include?(letter)
        update_good_guess(letter)
      else
        update_bad_guess(letter)
      end
    end

    def update_bad_guess(letter)
      puts "Oh no! #{letter} wasn't in the word."
      @incorrect_guesses << letter
      @lives -= 1
    end

    def update_good_guess(letter)
      puts "Good guess! #{letter} is in the word."
      @word.chars.each_with_index do |a, index|
        @display_hash[index] = letter if a == letter
      end
    end

    def play_game
      generate_display
      until @lives == 0  || @display_hash.values.join == @word
        guess_letter
        puts @display_hash.values.join(' ')

        binding.pry

      end
      @message = @lives == 0 ? "The word was #{@word}. Better luck next time!" : "Congratulations!"
      puts @message
    end
  end
end

# if present in the word, display all instances, replacing the underscores
# if absent, add to "guesses" array, and display along with a message re: lives remaining
# prompt player (and ask if they would like to save)
# continue until word is solved or player runs out of lives
# dislay win/loss message
